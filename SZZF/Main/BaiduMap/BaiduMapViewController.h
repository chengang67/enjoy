//
//  BaiduMapViewController.h
//  SZZF
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BaseViewController.h"

@protocol AddressControllerDelegate <NSObject>

- (void)didSelectedAddress:(NSString *)Address location:(CLLocationCoordinate2D)toPt;
@end

@interface BaiduMapViewController : BaseViewController<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>
{
    
    __weak IBOutlet BMKMapView *_mapView;
    BOOL _isFirstLocation;
    BMKUserLocation *_userLoc;
    BMKGeoCodeSearch *_searcher;
    BMKPointAnnotation* _animatedAnnotation;
    CLLocationCoordinate2D _selectPt;
    NSString *_selectAddress;
    __weak IBOutlet UIBarButtonItem *rightBtn;
}
@property(nonatomic,weak)id <AddressControllerDelegate> delegate;
- (IBAction)refreshLocation:(id)sender;
- (IBAction)rightBtnClick:(id)sender;

@end
