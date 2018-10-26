//
//  SCXDFileViewController.h
//  SZZF
//
//  Created by Apple on 2018/4/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuickLook/QuickLook.h>

@interface SCXDFileViewController : UIViewController<UIWebViewDelegate,QLPreviewControllerDelegate,QLPreviewControllerDataSource>

@property(nonatomic, copy)NSString *fileURLString;
@end
