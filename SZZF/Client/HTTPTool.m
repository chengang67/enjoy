//
//  HTTPTool.m
//  SZZF
//
//  Created by Apple on 2018/1/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "HTTPTool.h"
#import "Sign.h"
@implementation HTTPTool

+(AFHTTPSessionManager *)sharedManager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //最大请求并发任务数
    manager.operationQueue.maxConcurrentOperationCount = 5;
    
    // 请求格式
    // AFHTTPRequestSerializer            二进制格式
    // AFJSONRequestSerializer            JSON
    // AFPropertyListRequestSerializer    PList(是一种特殊的XML,解析起来相对容易)
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; // 上传普通格式
    
    // 超时时间
    manager.requestSerializer.timeoutInterval = 30.0f;
    // 设置请求头
    [manager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    // 设置接收的Content-Type
    manager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//返回格式 JSON
    //设置返回C的ontent-type
    manager.responseSerializer.acceptableContentTypes=[[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",nil];
    
    return manager;
    
}
//将字典转换为json字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
+ (void)getCacheRequestWithUrlString:(NSString *)urlString
                          parameters:(id)parameters
                           cacheTime:(float)time
                             succeed:(void(^)(id data))succeed
                                fail:(void(^)(NSString *error))fail{
    [SVProgressHUD show];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:parameters];
    
    if (![urlString isEqualToString:@"login"]) {
        NSString *token = [User currentUser].token ==nil ? @"": [User currentUser].token;
        NSString *timestamp = [StringUtils getCurrentTimeStamp];
        NSString *sign =  [Sign createSignWithTimeStamp:timestamp Token:token];
        //拼接参数
        if (token != NULL) {
            [dic setObject:token forKey:@"token"];
            [dic setObject:timestamp forKey:@"timestamp"];
            [dic setObject:sign forKey:@"sign"];
        }
    }
    
    NSString *url = [NSString stringWithFormat:@"%@%@",kSZXZBaseUrl,urlString];
    
    [[HTTPTool sharedManager] POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         [SVProgressHUD dismiss];
        //----打印完整网址------
        NSMutableString *urlS = @"".mutableCopy;
        for (NSString *key in dic) {
            NSString *temS = [NSString stringWithFormat:@"&%@=%@",key,dic[key]];
            [urlS appendString:temS];
        }
        [urlS replaceCharactersInRange:NSMakeRange(0, 1) withString:@"?"];
        NSLog(@"****请求链接：%@%@",task.originalRequest.URL, urlS);
        NSDictionary *dic = responseObject;
        NSInteger success = [[dic objectForKey:@"success"]integerValue];
       
        if (success ==0) {
            [SVProgressHUD showErrorWithStatus:[dic objectForKey:@"error"]];
        }else{
            succeed(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"****返回失败：%@**",error);
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"服务器繁忙，请稍后再试！"];
    }];
}

+ (void)uploadWithURLString:(NSString *)URLString
                 parameter:(id)parameter
                      model:(UIImage *)model
                   progress:(void (^)(float writeKB, float totalKB)) progress
                    succeed:(void (^)(id data))succeed
                       fail:(void (^)(NSString *error))fail{
    [SVProgressHUD showWithStatus:@"正在上传附件"];
    NSString *token = [User currentUser].token ==nil ? @"": [User currentUser].token;
    NSString *timestamp = [StringUtils getCurrentTimeStamp];
    NSString *sign =  [Sign createSignWithTimeStamp:timestamp Token:token];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:parameter];
    
    //拼接参数
    if (token != NULL) {
        [dic setObject:token forKey:@"token"];
        [dic setObject:timestamp forKey:@"timestamp"];
        [dic setObject:sign forKey:@"sign"];
    }
    NSString *url = [NSString stringWithFormat:@"%@%@",kSZXZBaseUrl,URLString];

    [[HTTPTool sharedManager] POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:UIImagePNGRepresentation(model)
                                    name:@"file"
                                fileName:[[NSString stringWithFormat:@"%@",model]stringByAppendingString:@".png"]
                                mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
        [SVProgressHUD dismiss];
        NSDictionary *dic = responseObject;
        NSInteger success = [[dic objectForKey:@"success"]integerValue];
        if (success ==0) {
            [SVProgressHUD showErrorWithStatus:[dic objectForKey:@"error"]];
        }else{
            succeed(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"****返回失败：%@**",error);
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"服务器繁忙，请稍后再试！"];
    }];
}

+ (void)uploadWithURLString:(NSString *)URLString
                 parameters:(NSArray *)parameters
                      model:(id)model
                   progress:(void (^)(float writeKB, float totalKB)) progress
                    succeed:(void (^)(id data))succeed
                       fail:(void (^)(NSString *error))fail{
    [SVProgressHUD showWithStatus:@"正在上传附件"];
    NSString *token = [User currentUser].token ==nil ? @"": [User currentUser].token;
    NSString *timestamp = [StringUtils getCurrentTimeStamp];
    NSString *sign =  [Sign createSignWithTimeStamp:timestamp Token:token];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    
    //拼接参数
    if (token != NULL) {
        [dic setObject:token forKey:@"token"];
        [dic setObject:timestamp forKey:@"timestamp"];
        [dic setObject:sign forKey:@"sign"];
    }
    NSString *url = [NSString stringWithFormat:@"%@%@",kBaseUrl,URLString];
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:10];
    if (parameters.count > 0) {
        for (UIImage *img in parameters) {
            [[HTTPTool sharedManager] POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                [formData appendPartWithFileData:UIImagePNGRepresentation(img)
                                            name:@"file"
                                        fileName:[[NSString stringWithFormat:@"%@",img]stringByAppendingString:@".png"]
                                        mimeType:@"image/png"];
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [SVProgressHUD dismiss];
                NSDictionary *dic = responseObject;
                NSInteger success = [[dic objectForKey:@"success"]integerValue];
                NSLog(@"responseObject === %@",responseObject);
                if (success ==0) {
                    [SVProgressHUD showErrorWithStatus:[dic objectForKey:@"error"]];
                }else{
                    NSString *imgName = [[dic objectForKey:@"data"]objectForKey:@"file"];
                    [tempArray addObject:imgName];
                    if (tempArray.count == parameters.count) {
                        succeed(tempArray);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"****返回失败：%@**",error);
                [SVProgressHUD dismiss];
                [SVProgressHUD showErrorWithStatus:@"服务器繁忙，请稍后再试！"];
            }];
        }
    }
    
   
}


@end
