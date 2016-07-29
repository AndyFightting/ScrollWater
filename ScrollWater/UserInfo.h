//
//  UserInfo.h
//  Archive
//
//  Created by 苏贵明 on 16/7/14.
//  Copyright © 2016年 苏贵明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject<NSCoding>

@property(nonatomic) NSInteger  userId;
@property(nonatomic,copy) NSString* userName;
@end
