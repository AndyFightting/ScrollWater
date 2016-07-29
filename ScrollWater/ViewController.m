//
//  ViewController.m
//  ScrollWater
//
//  Created by 苏贵明 on 16/7/13.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import "ViewController.h"
#import "WaterScrollView.h"
#import "ModelManager.h"
#import "UserInfo.h"

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
    
    for (int i=0; i<6; i++) {
        WaterModel* md = [WaterModel modelWithDic:@{@"tmpIndex":@(i)}];
        [modelArray addObject:md];
    }
    
    scroll = [[WaterScrollView alloc]initWithFrame:self.view.bounds columnNum:3];
    scroll.waterScrollDelegate = self;
    [self.view addSubview:scroll];
    [scroll refreshWithModels:modelArray];
    
    [self performSelector:@selector(addModel) withObject:nil afterDelay:4];
    [self performSelector:@selector(changeColumnNum) withObject:nil afterDelay:8];
    [self managerTest];
    
}

-(void)addModel{
//    添加model
    NSMutableArray* moreArray = [[NSMutableArray alloc]init];
    for (long i=modelArray.count; i<modelArray.count+10; i++) {
        WaterModel* md = [WaterModel modelWithDic:@{@"tmpIndex":@(i)}];
        [moreArray addObject:md];
    }
    
    [scroll loadMoreWithModels:moreArray];
}

-(void)changeColumnNum{
    [scroll refreshWithColumnChange:5];
}

#pragma mark - water scroll delegate
-(void)scrollCellTap:(WaterCell*)cell{
    cell.model.tmpIndex = 6666;
    [cell refresWhenModelChanged];
}


-(void)managerTest{
    
    //model
    UserInfo* info = [[UserInfo alloc]init];
    info.userId = 18;
    info.userName = @"guimingsu";
    [ModelManager saveModel:info]; //保存model
    
    UserInfo* md = [ModelManager getModel:[UserInfo class]];
    NSLog(@"userId= %ld -- userName= %@",md.userId,md.userName);


    //model array
    NSMutableArray* mdArray = [[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        UserInfo* info = [[UserInfo alloc]init];
        info.userId = i;
        info.userName = [NSString stringWithFormat:@"guimingsu ---array %d",i];
        [mdArray addObject:info];
    }
    [ModelManager saveModelArray:mdArray forClass:[UserInfo class]];
    NSArray* getMdArray = [ModelManager getModelArray:[UserInfo class]];
    
    for (UserInfo* u in getMdArray) {
        NSLog(@"userId= %ld -- userName= %@",u.userId,u.userName);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
