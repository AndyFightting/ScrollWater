//
//  WaterScrollView.m
//  ScrollWater
//
//  Created by 苏贵明 on 16/7/13.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import "WaterScrollView.h"

@implementation WaterScrollView{

    NSMutableArray* cellArray;
    NSMutableArray* heightArray;
    
    NSInteger columnNum;
    CGFloat cellSpacing;
    CGFloat cellWidth;

}
@synthesize waterScrollDelegate;

-(instancetype)initWithFrame:(CGRect)frame columnNum:(int)num{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        columnNum = num;
        cellSpacing = 10;//间隙 可修改
        cellWidth = (frame.size.width-(columnNum+1)*cellSpacing)/columnNum;
        
        cellArray = [[NSMutableArray alloc]init];
        heightArray = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)refreshWithModels:(NSArray*)models{
    [cellArray removeAllObjects];
    [heightArray removeAllObjects];
    
    for (UIView* v in self.subviews) {
        if ([v isKindOfClass:[WaterCell class]]) {
            [v removeFromSuperview];
        }
    }
    
    for (NSInteger i=0; i<columnNum; i++) {
        [heightArray addObject:@(cellSpacing)];
    }

    [self loadMoreWithModels:models];
}

-(void)loadMoreWithModels:(NSArray*)newModels{
    for (WaterModel* model in newModels) {
        model.cellWidth = cellWidth;
        
        NSInteger cellColumn = [self shortestColumnIndex];
        CGFloat originX = cellSpacing + (cellSpacing+cellWidth)*cellColumn;
        CGFloat originY = [heightArray[cellColumn] floatValue];
        
        WaterCell* cell = [[WaterCell alloc]initWithOrigin:CGPointMake(originX, originY) andModel:model];
        cell.delegate = self;
        [self addSubview:cell];
        
        cell.transform = CGAffineTransformMakeScale(0.01,0.01);
        [UIView animateWithDuration:0.3 animations:^{
            cell.transform = CGAffineTransformMakeScale(1,1);
        }];
        
        [cellArray addObject:cell];
        heightArray[cellColumn] = @(originY + model.cellHeight + cellSpacing);
    }
    
    NSInteger longestColumn = [self longestColumnIndex];
    [self setContentSize:CGSizeMake(self.frame.size.width, [heightArray[longestColumn] floatValue])];
}

-(void)refreshWithColumnChange:(int)num{
    columnNum = num;
    cellWidth = (self.frame.size.width-(columnNum+1)*cellSpacing)/columnNum;
    [heightArray removeAllObjects];

    for (NSInteger i=0; i<columnNum; i++) {
        [heightArray addObject:@(cellSpacing)];
    }
    
    for (int i=0; i<cellArray.count; i++) {
        WaterCell* cell = [cellArray objectAtIndex:i];
        cell.model.cellWidth = cellWidth;
        //cell.model.cellHeight 也可以改变，看需要咯!
        
        NSInteger cellColumn = [self shortestColumnIndex];
        CGFloat originX = cellSpacing + (cellSpacing+cellWidth)*cellColumn;
        CGFloat originY = [heightArray[cellColumn] floatValue];
        
        [cell refreshWithOrigin:CGPointMake(originX, originY)];
        heightArray[cellColumn] = @(originY + cell.model.cellHeight + cellSpacing);
    }
    
    NSInteger longestColumn = [self longestColumnIndex];
    [self setContentSize:CGSizeMake(self.frame.size.width, [heightArray[longestColumn] floatValue])];
}


- (NSUInteger)shortestColumnIndex{
    __block NSUInteger index = 0;
    __block CGFloat shortestHeight = MAXFLOAT;
    
    [heightArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        CGFloat height = [obj floatValue];
        if (height < shortestHeight){
            shortestHeight = height;
            index = idx;
        }
    }];
    
    return index;
}

- (NSUInteger)longestColumnIndex{
    __block NSUInteger index = 0;
    __block CGFloat longestHeight = 0;
    
    [heightArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop){
        CGFloat height = [obj floatValue];
        if (height > longestHeight){
            longestHeight = height;
            index = idx;
        }
    }];
    
    return index;
}

-(void)dealloc{
    [cellArray removeAllObjects];
    cellArray = nil;
}

#pragma mark - cell delegate
-(void)cellTap:(WaterCell *)cell{
    if ([waterScrollDelegate respondsToSelector:@selector(scrollCellTap:)]) {
        [waterScrollDelegate scrollCellTap:cell];
    }
}


@end
