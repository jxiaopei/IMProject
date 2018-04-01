//
//  NetWorkingDefine.h
//  IMProject
//
//  Created by Jin Xiao Pei on 2018/3/31.
//  Copyright © 2018年 Jin Xiao Pei. All rights reserved.
//

#ifndef NetWorkingDefine_h
#define NetWorkingDefine_h

#define NETWORK_STATE 1  //1是正式环境 0是测试环境
#define BaseHttpUrl   NETWORK_STATE ?  [[YYCache cacheWithName:CacheKey] objectForKey:@"serviceHost"]:@"http://172.16.5.105:8080"
#define BaseUrl(url)  [NSString stringWithFormat:@"%@%@",BaseHttpUrl,url]

#endif /* NetWorkingDefine_h */
