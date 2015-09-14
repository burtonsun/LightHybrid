//
//  HandlerCenter.m
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "HandlerCenter.h"
#import "DataHandlerList.h"
#import "DeviceHanlerList.h"
#import "UIHandlerList.h"
#import "NetHandlerList.h"
static HandlerCenter *center = nil;
@implementation HandlerCenter
-(id)init
{
    self = [super init];
    if (self)
    {
        self.allHandlerDic = [[NSMutableDictionary alloc] init];
        [self.allHandlerDic setObject:[[DataHandlerList alloc] init] forKey:[NSNumber numberWithInt:DataService ]];
        [self.allHandlerDic setObject:[[DeviceHanlerList alloc] init] forKey:[NSNumber numberWithInt:DeviceService ]];
        [self.allHandlerDic setObject:[[NetHandlerList alloc] init] forKey:[NSNumber numberWithInt:NetService ]];
        [self.allHandlerDic setObject:[[UIHandlerList alloc] init] forKey:[NSNumber numberWithInt:UIService ]];
    }
    return  self;
}

+(instancetype)shareInstance
{
    static dispatch_once_t centerCount;
    dispatch_once(&centerCount, ^{
        if(center == nil)
        {
            center = [[HandlerCenter alloc] init];
        }
    });
    return center;
}
-(void)addHandler:(BaseHandlerList*)handle forType:(HandlerType)type
{
    if ([self.allHandlerDic objectForKey:[NSNumber numberWithInt:type ]])
    {
        [self.allHandlerDic removeObjectForKey:[NSNumber numberWithInt:type ]];
    }
    [self.allHandlerDic setObject:handle forKey:[NSNumber numberWithInt:type ]];
}

@end
