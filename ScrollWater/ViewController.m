//
//  ViewController.m
//  ScrollWater
//
//  Created by 苏贵明 on 16/7/13.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import "ViewController.h"
#import "WaterScrollView.h"

@interface ViewController ()<WaterScrollDelegate>

@end

@implementation ViewController{

    NSMutableArray* modelArray;
    WaterScrollView* scroll;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    modelArray = [[NSMutableArray alloc]init];
    
    for (int i=0; i<30; i++) {
        WaterModel* md = [WaterModel modelWithDic:@{@"tmpIndex":@(i)}];
        [modelArray addObject:md];
    }
    
    scroll = [[WaterScrollView alloc]initWithFrame:self.view.bounds columnNum:3];
    scroll.waterScrollDelegate = self;
    [self.view addSubview:scroll];
    [scroll refreshWithModels:modelArray];
    
    [self performSelector:@selector(test) withObject:nil afterDelay:3];
    
}

-(void)test{
//    NSMutableArray* moreArray = [[NSMutableArray alloc]init];
//    for (long i=modelArray.count; i<modelArray.count+15; i++) {
//        WaterModel* md = [WaterModel modelWithDic:@{@"tmpIndex":@(i)}];
//        [moreArray addObject:md];
//    }
//    
//    [scroll loadMoreWithModels:moreArray];
    
    [scroll refreshWithColumnChange:5];

}

#pragma mark - water scroll delegate
-(void)scrollCellTap:(WaterCell*)cell{
    cell.model.tmpIndex = 6666;
    [cell refresWhenModelChanged];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
