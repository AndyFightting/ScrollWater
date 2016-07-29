//
//  WaterCell.m
//  ScrollWater
//
//  Created by 苏贵明 on 16/7/13.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import "WaterCell.h"

@implementation WaterCell{

    UILabel* tmpLabel;

}
@synthesize delegate,model;

-(instancetype)initWithOrigin:(CGPoint)origin andModel:(WaterModel*)md{
    CGRect frame = CGRectMake(origin.x, origin.y, md.cellWidth, md.cellHeight);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
        UITapGestureRecognizer* tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cellTap)];
        [self addGestureRecognizer:tapG];
        
        model = md;
        
        //这里添加控件
        tmpLabel = [[UILabel alloc]init];
        tmpLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:tmpLabel];
        
        [self refresh];
    }
    return self;
}

//这里刷新 位置，内容
-(void)refresh{
    [tmpLabel setFrame:CGRectMake(0, 0, model.cellWidth, model.cellHeight)];
    tmpLabel.text = [NSString stringWithFormat:@"%d",model.tmpIndex];
}

-(void)refreshWithOrigin:(CGPoint)origin{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(origin.x, origin.y, model.cellWidth, model.cellHeight);
        [self refresh];
    }];
}

-(void)refresWhenModelChanged{
    [self refresh];
}

-(void)cellTap{
    [delegate cellTap:self];
}

@end
