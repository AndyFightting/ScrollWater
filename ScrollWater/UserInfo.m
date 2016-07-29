//
//  UserInfo.m
//  Archive
//
//  Created by 苏贵明 on 16/7/14.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

#pragma mark - 实现 coder 协议
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeInteger:self.userId forKey:@"userId"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userId = [aDecoder decodeIntegerForKey:@"userId"];
    }
    return self;
}

@end
