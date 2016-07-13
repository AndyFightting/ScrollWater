//
//  WaterScrollView.h
//  ScrollWater
//
//  Created by 苏贵明 on 16/7/13.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterCell.h"

@protocol WaterScrollDelegate <NSObject>
@optional
-(void)scrollCellTap:(WaterCell*)cell;
@end

@interface WaterScrollView : UIScrollView<WaterCellDelegate>

@property(nonatomic,weak)id<WaterScrollDelegate> waterScrollDelegate;

-(instancetype)initWithFrame:(CGRect)frame columnNum:(int)num;
-(void)refreshWithModels:(NSArray*)models;//刷新
-(void)loadMoreWithModels:(NSArray*)newModels;//添加更多
-(void)refreshWithColumnChange:(int)num;//改变column刷新

@end
