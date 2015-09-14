//
//  UIHandlerList.m
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//
/**
 *  UI接口
 */
#import "UIHandlerList.h"

#import "DelegateObject.h"
#import "QCHybrud-swift.h"
@implementation UIHandlerList
-(void)registerHandler
{
    DelegateObject *delegateObject = [[DelegateObject alloc] init];
    delegateObject.handler = self;
    __weak typeof(self) weakSelf = self;
}

@end
