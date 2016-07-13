//
//  WaterModel.m
//  ScrollWater
//
//  Created by 苏贵明 on 16/7/13.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import "WaterModel.h"

@implementation WaterModel

+(WaterModel*)modelWithDic:(NSDictionary*)dic{
    WaterModel* model = [[WaterModel alloc]init];
    if (dic) {
        [model setValuesForKeysWithDictionary:dic];
     
        //-------这里要计算model.cellHeight, model.cellWidth不需要处理--------
        int  tmpIndex = model.tmpIndex;
        if (tmpIndex % 3 == 0) {
            model.cellHeight = 100;
        }else if (tmpIndex % 3 == 1){
            model.cellHeight = 150;
        }else{
            model.cellHeight = 200;
        }
    }
    
    return model;
}

-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //必须要
}
@end
