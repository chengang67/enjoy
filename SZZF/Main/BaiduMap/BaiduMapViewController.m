//
//  BaiduMapViewController.m
//  SZZF
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaiduMapViewController.h"

@interface BaiduMapViewController ()
{
    BMKLocationService * _locService;
}
@end

@implementation BaiduMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    _locService = [[ BMKLocationService alloc]init];
    [_locService startUserLocationService];
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态为普通定位模式
    _mapView.showsUserLocation = YES;//显示定位图层
    _mapView.zoomLevel = 18;
}
- (IBAction)refreshLocation:(id)sender {
    [_mapView updateLocationData:_userLoc];
    [_mapView setCenterCoordinate:_userLoc.location.coordinate animated:YES];
}

- (IBAction)rightBtnClick:(id)sender {
    NSLog(@"==%@",self.delegate);
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedAddress:location:)]) {
        [self.delegate didSelectedAddress:_selectAddress location:_selectPt];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"地图定位失败======%@",error);
}

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
   // NSLog(@"heading is %@",userLocation.heading);
    [_mapView updateLocationData:userLocation];
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    _userLoc = userLocation;
    if (!_isFirstLocation) {
        _selectPt = userLocation.location.coordinate;
        [self baiduMapReverseGeocode:userLocation.location.coordinate];
        [_mapView updateLocationData:userLocation];
        [_mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
        _isFirstLocation = !_isFirstLocation;
    }
    
}

//单击地图事件
- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate{
    [self baiduMapReverseGeocode:coordinate];
    _animatedAnnotation = nil;
    _selectPt = coordinate;
    [_mapView removeAnnotations:_mapView.annotations];
    
}

-(void)baiduMapReverseGeocode:(CLLocationCoordinate2D)pt{
    _searcher = [[BMKGeoCodeSearch alloc]init];
    _searcher.delegate = self;
    BMKReverseGeoCodeOption *reverseGeoCodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeoCodeSearchOption.reverseGeoPoint = pt;
    BOOL flag = [_searcher reverseGeoCode:reverseGeoCodeSearchOption];
    if(flag)
    {
        NSLog(@"反geo检索发送成功");
    }
    else
    {
        NSLog(@"反geo检索发送失败");
    }
}

//接收反向地理编码结果
-(void) onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:
(BMKReverseGeoCodeResult *)result
                        errorCode:(BMKSearchErrorCode)error{
    if (error == BMK_SEARCH_NO_ERROR) {
        [self addAnimatedAnnotation:_selectPt];
        _selectAddress = [NSString stringWithFormat:@"%@%@%@",result.addressDetail.district,
                          result.addressDetail.streetName,result.addressDetail.streetNumber];
    }
    else {
        NSLog(@"抱歉，未找到结果");
    }
}

// 添加动画Annotation
- (void)addAnimatedAnnotation:(CLLocationCoordinate2D)pt {
    if (_animatedAnnotation == nil) {
        _animatedAnnotation = [[BMKPointAnnotation alloc]init];
        _animatedAnnotation.coordinate = pt;
        _animatedAnnotation.title = _selectAddress;
    }
    [_mapView addAnnotation:_animatedAnnotation];
}
//- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view{
//    NSLog(@"sssssss");
//}
//

//// 根据anntation生成对应的View
//- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
//{
//    BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
//    newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
//    newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
//    newAnnotationView.annotation=annotation;
//    newAnnotationView.image = [UIImage imageNamed:@"dj1"];   //把大头针换成别的图片
//
//    newAnnotationView.size = CGSizeMake(23, 23);
//    return newAnnotationView;
//}



-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;//定位
    _searcher.delegate = self;//地理编码
}

-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    _searcher.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
