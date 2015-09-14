//
//  HandlerCenter.h
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseHandlerList.h"

#import "JsBrigeDefine.h"

@interface HandlerCenter : NSObject

@property(nonatomic,retain)NSMutableDictionary *allHandlerDic;

+(instancetype)shareInstance;
-(void)addHandler:(BaseHandlerList*)handle forType:(HandlerType)type;

@end
