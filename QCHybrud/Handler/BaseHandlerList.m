//
//  BaseHandler.m
//  hybirdDemo
//
//  Created by user on 15/1/5.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "BaseHandlerList.h"

@interface BaseHandlerList ()
{
    NSMutableDictionary* _handlerList;
}
@end

@implementation BaseHandlerList

-(id)init
{
    self = [super init];
    if (self)
    {
        _handlerList = [[NSMutableDictionary alloc] init];
        [self registerHandler];
    }
    return self;
}
-(NSUInteger)count
{
    return[_handlerList count];
}
-(NSMutableDictionary*)getHandlerList
{
    return _handlerList;
}
-(void)addHandler:(handleBlock)handler handleName:(NSString*)name
{
    if (_handlerList)
    {
        [_handlerList setObject:handler forKey:name];
    }
}
-(void)registerHandler
{
    
}
-(void)setRunView:(UIWebView*)webView Delegate:(id<UIWebViewDelegate>)delegate
{
    if (webView&&delegate)
    {
        webView.delegate = delegate;
    }
}

@end
