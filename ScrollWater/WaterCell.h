//
//  WaterCell.h
//  ScrollWater
//
//  Created by 苏贵明 on 16/7/13.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterModel.h"

@class WaterCell;
@protocol WaterCellDelegate <NSObject>
-(void)cellTap:(WaterCell*)cell;
@end


@interface WaterCell : UIView
@property (nonatomic, weak) id <WaterCellDelegate> delegate;
@property (nonatomic,strong) WaterModel* model;

-(instancetype)initWithOrigin:(CGPoint)origin andModel:(WaterModel*)md;
-(void)refreshWithOrigin:(CGPoint)origin;
-(void)refresWhenModelChanged;

@end


