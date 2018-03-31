//
//  NetWorkingTool.m
//  IMProject
//
//  Created by Jin Xiao Pei on 2018/3/30.
//  Copyright © 2018年 Jin Xiao Pei. All rights reserved.
//

#import "NetWorkingTool.h"
#import "NetDataParsingTool.h"

@implementation NetWorkingTool

+(instancetype)shareTool{
    static NetWorkingTool *tool = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        tool = [[self alloc] init];
    });
    return tool;
}

- (AFHTTPSessionManager *)sharedJsonManager{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[AFHTTPSessionManager alloc]initWithBaseURL:nil];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/html",@"text/javascript",nil];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.requestSerializer  = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 20;
    });
    return manager;
}

/**
 *  Post形式提交数据
 *
 *  @param urlString  Url
 *  @param parameters 参数
 *  @param success    成功Block
 *  @param fail       失败Block
 */
- (void)postJsonWithUrl:(NSString *)urlString parameters:(id)parameters success:(NetRequestSuccessBlock)success fail:(NetRequestFailedBlock)fail
{
    
    AFHTTPSessionManager *manager =  [self sharedJsonManager];
    
    [manager POST:urlString parameters:[NetDataParsingTool inputParsing:parameters] progress:^(NSProgress * _Nonnull uploadProgress) {
        
    }  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success([NetDataParsingTool outputParsing:responseObject]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (fail) {
            fail(error);
        }
    }];
}

/**
 *  Get形式提交数据
 *
 *  @param urlString  Url
 *  @param parameters 参数
 *  @param success    成功Block
 *  @param fail       失败Block
 */
- (void)getJsonWithUrl:(NSString *)urlString parameters:(id)parameters success:(NetRequestSuccessBlock)success fail:(NetRequestFailedBlock)fail
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    manager.requestSerializer.timeoutInterval = 15;
//    NSMutableDictionary *baseParameters = [[NSMutableDictionary alloc] initWithDictionary:parameters];
//    NSMutableString *url = [urlString mutableCopy];
//    //    [self resetURL:url Parameters:baseParameters];
    [manager GET:urlString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            NSString *dataStr = [responseObject mj_JSONString];
            NSData *data = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
            NSError *error;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            success(dict);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (fail) {
            fail(error);
        }
    }];
}

@end
