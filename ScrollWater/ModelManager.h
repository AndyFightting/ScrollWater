//
//  ArchiveManager.h
//  Archive
//
//  Created by 苏贵明 on 16/7/14.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelManager : NSObject

//单个model
+(void)saveModel:(NSObject*)model;
+(id)getModel:(__weak Class)cl;
+(void)deleteModel:(__weak Class)cl;

//model数组
+(void)saveModelArray:(NSArray*)modelArray forClass:(__weak Class)cl;
+(NSArray*)getModelArray:(__weak Class)cl;
+(void)deleteModelArray:(__weak Class)cl;
@end
