//
//  DeviceHanlerList.m
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "DeviceHanlerList.h"
#import "JsBrigeUitil.h"
#import "DelegateObject.h"
#import "QCSYWebView.h"
#import "CoreJSBrige.h"
#import "JSONKit.h"
#import "JsBrigeDefine.h"


@implementation DeviceHanlerList

-(void)registerHandler
{
    DelegateObject *delegateObject = [[DelegateObject alloc] init];
    delegateObject.handler = self;
    __weak typeof(self) weakSelf = self;
}

@end
