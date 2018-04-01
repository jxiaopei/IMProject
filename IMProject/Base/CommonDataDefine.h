//
//  CommonDataDefine.h
//  IMProject
//
//  Created by Jin Xiao Pei on 2018/3/31.
//  Copyright © 2018年 Jin Xiao Pei. All rights reserved.
//

#ifndef CommonDataDefine_h
#define CommonDataDefine_h

#define ShareApplicationDelegate [[UIApplication sharedApplication] delegate]
#define StringFormat(string, args...)       [NSString stringWithFormat:string, args]
#define Log_ResponseObject                   NSLog(@"%@",[responseObject mj_JSONString])
#define ImagePlaceHolder                    [UIImage imageNamed:@"占位图"]
#define StringIsEmpty(str)      ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
#define WeakObject(obj)          __weak typeof(obj) weakObject = obj;
#define StrongObject(obj)        __strong typeof(obj) strongObject = weakObject;
// 字体
#define Font(size) [UIFont systemFontOfSize:size]

#define  SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

#define HEXCOLOR(rgbValue)
    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0                                                 \
    green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0                                                                    \
    blue:((float)(rgbValue & 0xFF)) / 255.0                                                                              \
    alpha:1.0]

#define RCD_IS_IPHONEX (RCDscreenWidth>=375.0f && RCDscreenHeight>=812.0f)

#endif /* CommonDataDefine_h */
