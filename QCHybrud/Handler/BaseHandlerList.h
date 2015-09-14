//
//  BaseHandler.h
//  hybirdDemo
//
//  Created by user on 15/1/5.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JsBrigeDefine.h"

@interface BaseHandlerList : NSObject<HandlerDelegate>

-(void)addHandler:(handleBlock)handler handleName:(NSString*)name;
-(NSUInteger)count;
-(void)registerHandler;
-(void)setRunView:(UIWebView*)webView Delegate:(id<UIWebViewDelegate>)delegate;
@end
