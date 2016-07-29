//
//  ArchiveManager.m
//  Archive
//
//  Created by 苏贵明 on 16/7/14.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import "ModelManager.h"

@implementation ModelManager

#pragma mark - 单个model
+(void)saveModel:(NSObject*)model{
    BOOL isIn =  [NSKeyedArchiver archiveRootObject:model toFile:[self modelPath:[[model class] description]]];
    if (isIn) {
        NSLog(@"instance保存成功");
    }else{
        NSLog(@"instance保存失败");
    }
}

+(id)getModel:(__weak Class)cl{
    id instance =  [NSKeyedUnarchiver unarchiveObjectWithFile:[self modelPath:[[cl class] description]]];
    return instance;
}

+(void)deleteModel:(__weak Class)cl{
    NSFileManager *fileMger = [NSFileManager defaultManager];
    BOOL bRet = [fileMger fileExistsAtPath:[self modelPath:[[cl class] description]]];
    if (bRet) {
        NSError *err;
        [fileMger removeItemAtPath:[self modelPath:[[cl class] description]] error:&err];
        NSLog(@"instance删除成功");
    }
}

+(NSString*)modelPath:(NSString*)className{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *savePath = [[paths objectAtIndex:0] stringByAppendingString:[NSString stringWithFormat:@"/guimingsu_%@.plist",className]];
    return savePath;
}

#pragma mark - model 数组
+(void)saveModelArray:(NSArray*)modelArray forClass:(__weak Class)cl{
    NSMutableArray* dataArray = [[NSMutableArray alloc]init];
    for (NSObject* model in modelArray) {
        NSData* data = [NSKeyedArchiver archivedDataWithRootObject:model];
        [dataArray addObject:data];
    }
    
    BOOL isIn =  [NSKeyedArchiver archiveRootObject:dataArray toFile:[self modelArrayPath:[[cl class] description]]];
    if (isIn) {
        NSLog(@"array保存成功");
    }else{
        NSLog(@"array保存失败");
    }
}

+(NSArray*)getModelArray:(__weak Class)cl{
    NSMutableArray* modelArray = [[NSMutableArray alloc]init];
    NSArray* dataArray =  [NSKeyedUnarchiver unarchiveObjectWithFile:[self modelArrayPath:[[cl class] description]]];
    for (NSData* data in dataArray) {
        NSObject* model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [modelArray addObject:model];
    }
    return modelArray;
}

+(void)deleteModelArray:(__weak Class)cl{
    NSFileManager *fileMger = [NSFileManager defaultManager];
    BOOL bRet = [fileMger fileExistsAtPath:[self modelArrayPath:[[cl class] description]]];
    if (bRet) {
        NSError *err;
        [fileMger removeItemAtPath:[self modelArrayPath:[[cl class] description]] error:&err];
        NSLog(@"array删除成功");
    }
}

+(NSString*)modelArrayPath:(NSString*)className{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *savePath = [[paths objectAtIndex:0] stringByAppendingString:[NSString stringWithFormat:@"/guimingsu_Array_%@.plist",className]];
    return savePath;
}
@end
