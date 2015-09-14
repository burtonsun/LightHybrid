//
//  DataHandlerList.m
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "DataHandlerList.h"

#import "JSONKit.h"
#import "CoreJSBrige.h"

#import "DelegateObject.h"

#import "JsBrigeUitil.h"

@implementation DataHandlerList
-(void)registerHandler
{
    __weak typeof(self) weakSelf = self;
    DelegateObject *delegateObject = [[DelegateObject alloc] init];
    delegateObject.handler = self;

}
@end
