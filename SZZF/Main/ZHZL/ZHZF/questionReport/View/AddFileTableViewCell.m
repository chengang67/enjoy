//
//  AddFileTableViewCell.m
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "AddFileTableViewCell.h"

@implementation AddFileTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.compressionImageArray = [NSMutableArray array];
}

-(void)config:(BeventModel2 *)model{
    if (self.tag == 0) {//处置前附件
        self.accessoryArr =[StringUtils componentSeparatedByString:model.pe_content_accessory];
    }else{//处置后附件
        self.fileTitle.text = @"处置后附件";
        self.accessoryArr = [StringUtils componentSeparatedByString:model.pe_results_accessory];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)add:(id)sender {
    [self showAlertView];
}

- (void)showAlertView{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择添加方式" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *album = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self getphotoFromAlbum];
    }];
    UIAlertAction *takephoto = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self getPhotoFromCamare];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:album];
    [alert addAction:takephoto];
    [alert addAction:cancel];
    [self.rootVC presentViewController:alert animated:YES completion:nil];
    
}

-(void)getphotoFromAlbum{
    LGPhotoPickerViewController *pickerVc = [[LGPhotoPickerViewController alloc] initWithShowType:LGShowImageTypeImagePicker];
    pickerVc.status = PickerViewShowStatusCameraRoll;
    pickerVc.maxCount = 5;   // 最多能选9张图片
    pickerVc.delegate = self;
    //    pickerVc.nightMode = YES;//夜间模式
    self.showType = LGShowImageTypeImagePicker;
    [pickerVc showPickerVc:self.rootVC];
}

- (void)getPhotoFromCamare{
    ZLCameraViewController *cameraVC = [[ZLCameraViewController alloc] init];
    // 拍照最多个数
    cameraVC.maxCount = 5;
    // 连拍
    cameraVC.cameraType = ZLCameraContinuous;
    cameraVC.callback = ^(NSArray *cameras){
        //在这里得到拍照结果
        //数组元素是ZLCamera对象
        for (ZLCamera *canamerPhoto in cameras) {
            UIImage *image = canamerPhoto.thumbImage;
            [self.compressionImageArray addObject:image];
        }
        [self.imgCollectionView reloadData];
    };
    [cameraVC showPickerVc:self.rootVC];
    
}

#pragma mark - LGPhotoPickerViewControllerDelegate

- (void)pickerViewControllerDoneAsstes:(NSArray *)assets isOriginal:(BOOL)original{
     //assets的元素是LGPhotoAssets对象，获取image方法如下:
    
     for (LGPhotoAssets *photo in assets) {
         //获取相册的URL
         [self.compressionImageArray addObject:photo.compressionImage];
     }
    NSLog(@"%@==",self.compressionImageArray);
    [self.imgCollectionView reloadData];
    [self uploadImageWithImageArray:self.compressionImageArray];
}

- (void)uploadImageWithImageArray:(NSMutableArray *)imageArray{
     NSLog(@"pe_results_accessory==%@",self.mBEventModel.pe_results_accessory);
    [HTTPTool uploadWithURLString:@"upload/accessory" parameters:imageArray model:nil progress:^(float writeKB, float totalKB) {
        
    } succeed:^(id data){
        for (NSString *imgName in data) {
            [self file4accessoryWith:imgName];
        }
        NSLog(@"%@==%@",data,self.mBEventModel.pe_results_accessory);
    } fail:^(NSString *error) {
        
    }];
}

- (void) file4accessoryWith:(NSString *)imgName{
    if (self.tag == 0) {
        if (self.mBEventModel.pe_content_accessory.length ==0) {
            self.mBEventModel.pe_content_accessory = imgName;
        }else {
            self.mBEventModel.pe_content_accessory = [self.mBEventModel.pe_content_accessory stringByAppendingString:[NSString stringWithFormat:@",%@",imgName]];
        }
    }else{
        if (self.mBEventModel.pe_results_accessory.length ==0) {
            self.mBEventModel.pe_results_accessory = imgName ;
        }else {
            self.mBEventModel.pe_results_accessory = [self.mBEventModel.pe_results_accessory stringByAppendingString:[NSString stringWithFormat:@",%@",imgName]];
        }
    
    }
}

- (NSData *)Image4Data:(UIImage *)image{
    NSData * imageData = UIImageJPEGRepresentation(image, 0.5);
    return imageData;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.compressionImageArray.count >0) {
        return self.compressionImageArray.count;
    }else{
        return self.accessoryArr.count;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectioncell" forIndexPath:indexPath];
    if (self.compressionImageArray.count >0) {
        //从相册或者拍着的照片
        cell.imageCell.image = self.compressionImageArray[indexPath.row];
    }else{
        //从服务器获取的照片
       [cell.imageCell sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kBaseImageUrl,self.accessoryArr[indexPath.row]]] placeholderImage:[UIImage imageNamed:@"conduct"]];
    }
    
    
    return cell;
    
}

@end
