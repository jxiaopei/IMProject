//
//  IMDataManager.m
//  IMProject
//
//  Created by Jin Xiao Pei on 2018/3/30.
//  Copyright © 2018年 Jin Xiao Pei. All rights reserved.
//

#import "IMDataManager.h"
#import "IMDefineDataHeader.h"

@implementation IMDataManager

+(void)settingIMData{

    //非debug模式初始化sdk
    [[RCIM sharedRCIM] initWithAppKey:RONGCLOUD_IM_APPKEY];
    
    [RCIM sharedRCIM].globalConversationPortraitSize = CGSizeMake(46, 46);
    //        [RCIM sharedRCIM].portraitImageViewCornerRadius = 10;
    //开启用户信息和群组信息的持久化
    [RCIM sharedRCIM].enablePersistentUserInfoCache = YES;
    
    
    [self loginWithIM];
}



+(void)loginWithIM{
    [[RCIM sharedRCIM] connectWithToken:@"YourTestUserToken"     success:^(NSString *userId) {
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%zd", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];
}

@end
