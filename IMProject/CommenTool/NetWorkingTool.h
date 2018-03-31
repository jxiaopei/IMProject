//
//  NetWorkingTool.h
//  IMProject
//
//  Created by Jin Xiao Pei on 2018/3/30.
//  Copyright © 2018年 Jin Xiao Pei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NetRequestSuccessBlock)(id responseObject);//成功Block
typedef void (^NetRequestFailedBlock)(NSError *error);//失败Block

@interface NetWorkingTool : NSObject

+(instancetype)shareTool;

- (void)postJsonWithUrl:(NSString *)urlString parameters:(id)parameters success:(NetRequestSuccessBlock)success fail:(NetRequestFailedBlock)fail;

- (void)getJsonWithUrl:(NSString *)urlString parameters:(id)parameters success:(NetRequestSuccessBlock)success fail:(NetRequestFailedBlock)fail;

@end
