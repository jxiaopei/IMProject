//
//  NetDataParsingTool.h
//  IMProject
//
//  Created by Jin Xiao Pei on 2018/3/30.
//  Copyright © 2018年 Jin Xiao Pei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetDataParsingTool : NSObject

+ (NSString *)inputParsing:(NSDictionary *)dict;

+ (NSDictionary *)outputParsing:(id)responseObject;

@end
