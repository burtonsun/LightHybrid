//
//  LocalRouter.h
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.

/**
 *  本地路由接口
 */
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HandlerCenter.h"
#import "JsBrigeDefine.h"

@interface LocalRouter : NSObject

@property(nonatomic,retain)HandlerCenter *handlerCenter;
@property(nonatomic,weak)id<HandlerDelegate>delegate;
@property(nonatomic,retain)UIWebView *runWebView;

+(instancetype)shareLocatRouter;

-(BOOL)routeUrl:(NSURLRequest*)urlRequest;

@end
