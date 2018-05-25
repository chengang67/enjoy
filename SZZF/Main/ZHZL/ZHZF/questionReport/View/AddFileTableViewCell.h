//
//  AddFileTableViewCell.h
//  SZZF
//
//  Created by Apple on 2018/1/23.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageViewCollectionViewCell.h"


#import "UIImageView+WebCache.h"
@interface AddFileTableViewCell : UITableViewCell<LGPhotoPickerViewControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *addbtn;
@property (weak, nonatomic) IBOutlet UICollectionView *imgCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *fileTitle;

@property(nonatomic, assign)NSInteger tag;//0:处置前附件    1:处置后附件
@property (nonatomic, assign) LGShowImageType showType;
@property(nonatomic,strong)UIViewController *rootVC;
@property(nonatomic, strong)BeventModel2 *mBEventModel;
@property(nonatomic, strong)NSMutableArray *compressionImageArray;
@property(nonatomic , strong)NSArray *accessoryArr;

-(void)config:(BeventModel2 *)model;
@end
