//
//  HTTPTool.h
//  SZZF
//
//  Created by Apple on 2018/1/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface HTTPTool : NSObject
-(AFHTTPSessionManager *)sharedManager;
/**
 *  Post请求 <在缓存时间之内只读取缓存数据，不会再次网络请求，减少服务器请求压力。缺点：在缓存时间内服务器数据改变，缓存数据不会及时刷新>
 *
 *  @param urlString  请求地址
 *  @param parameters 拼接的参数
 *  @param time       缓存时间（单位：分钟）
 *  @param succeed    请求成功
 *  @param fail       请求失败
 */

+ (void)getCacheRequestWithUrlString:(NSString *)urlString
                          parameters:(id)parameters
                           cacheTime:(float)time
                             succeed:(void(^)(id data))succeed
                                fail:(void(^)(NSString *error))fail;


/**
 *  上传图片
 *
 *  @param URLString  请求地址
 *  @param parameter  拼接的参数
 *  @param model      要上传的图片model
 *  @param progress   上传进度(writeKB：已上传多少KB, totalKB：总共多少KB)
 *  @param succeed    上传成功
 *  @param fail       上传失败
 */
+ (void)uploadWithURLString:(NSString *)URLString
                 parameter:(id)parameter
                      model:(UIImage *)model
                   progress:(void (^)(float writeKB, float totalKB)) progress
                    succeed:(void (^)(id data))succeed
                       fail:(void (^)(NSString *error))fail;

/**
 *  上传多文件
 *
 *  @param URLString  请求地址
 *  @param parameters 拼接的参数
 *  @param model      要上传的图片model
 *  @param progress   上传进度(writeKB：已上传多少KB, totalKB：总共多少KB)
 *  @param succeed    上传成功
 *  @param fail       上传失败
 */
+ (void)uploadWithURLString:(NSString *)URLString
                 parameters:(NSArray *)parameters
                      model:(id)model
                   progress:(void (^)(float writeKB, float totalKB)) progress
                    succeed:(void (^)(id data))succeed
                       fail:(void (^)(NSString *error))fail;



@end
