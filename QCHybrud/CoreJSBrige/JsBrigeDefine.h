//
//  JsBrigeDefine.h
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//

#ifndef hybirdDemo_JsBrigeDefine_h
#define hybirdDemo_JsBrigeDefine_h


#endif

#define JS_REQUEST_SCHAME @"corejsbrigescheme"
#define APPLE_DATA_SCHAME @"applewebdata"
#define NO_PARAM @"NO_PARAM"
#define WEAK_SELF @"__weak typeof(self) weakSelf = self"
#define MINE_TYPE @"text/html"
#define LOCAL_PAGE_PREFIX @"localpage"

#import <UIKit/UIKit.h>

typedef void(^JSCallBlock)(NSString *jsCallBackName,NSString* data);
typedef void(^handleBlock)(NSDictionary* data,NSString *jsCallBackName,BOOL isNeedData,UIWebView *runWebView);

typedef NS_ENUM(NSInteger, HandlerType)
{
    NetService = 440,
    DataService = 540,
    UIService = 940,
    DeviceService = 140
};

@protocol QCSYWebViewDelegate <NSObject>

-(void)recordBrowse:(NSString*)url;

@end

@protocol HandlerDelegate <NSObject>

-(NSMutableDictionary*)getHandlerList;

@end