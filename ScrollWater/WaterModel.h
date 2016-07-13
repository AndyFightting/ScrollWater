//
//  WaterModel.h
//  ScrollWater
//
//  Created by 苏贵明 on 16/7/13.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WaterModel : NSObject
@property(nonatomic) float cellWidth;
@property(nonatomic) float cellHeight;

@property(nonatomic) int tmpIndex;

+(WaterModel*)modelWithDic:(NSDictionary*)dic;

@end
