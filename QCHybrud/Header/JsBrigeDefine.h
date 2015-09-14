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
#define MAP_KEY @"AyrG4vpWnDcMcCMm9SdCbd2R"
#define LOCAL_PAGE_PREFIX @"localpage"
#define SOUND_TYPE1 @"amr"
#define SOUND_TYPE2 @"mp3"
#define HEAD_SIZE @"width=80&height=80"
#define HEAD_SIZE_BIG @"width=100&height=100"

#pragma mark SIZE
#define NAVIGATION_BAR_HEIGHT 44
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define NAV_BAR_HIGHT 64
#define NAV_ITEM_HIGHT 34
#define NAV_ITEM_WIDTH 34
#define TITLE_LABLE_WIDTH 80
#define LINE_HIGHT 0.5
#define TAB_BAR_HIHT 49
#define CELL_HIGHT 40
#define STATUS_BAR_HIGHT 20
#define COMMON_MARG_SIZE 30
#define TEXT_FIELD_HIGH 28
#define COMMON_BUTTON_HIGHT 40
#define COMMON_TEXTFIELD_HIGHT 24
#define COMMON_BUTTON_CORNER 3
#define TAB_ITEM_WIDTH 20



#define THEME_MAIN_COLOR [[UIColor alloc] initWithRed:0.309 green:0.756 blue:0.913 alpha:1]
#define THEME_DARK_COLOR [[UIColor alloc] initWithRed:0.231 green:0.690 blue:0.854 alpha:1]
#define DARK_LINE_COLOR [[UIColor alloc] initWithRed:0.200 green:0.662 blue:0.874 alpha:1]
#define LIGHT_LINE_COLOR [[UIColor alloc] initWithRed:0.482 green:0.827 blue:0.925 alpha:1]
#define TITLE_COLOR [[UIColor alloc] initWithRed:0.415 green:0.466 blue:0.501 alpha:1]
#define LABLE_COLOR [[UIColor alloc] initWithRed:0.490 green:0.556 blue:0.603 alpha:1]
#define WARING_COLOR [[UIColor alloc] initWithRed:0.901 green:0.298 blue:0.396 alpha:1]
#define DARK_BACK_COLOR [[UIColor alloc] initWithRed:0.905 green:0.925 blue:0.945 alpha:1]
#define TAB_BAR_BAC_COLOR [[UIColor alloc] initWithRed:25/255.0 green:25/255.0 blue:25/255.0 alpha:0.75]
#define LIGHT_BLACK_COLOR [[UIColor alloc] initWithRed:236/255.0 green:241/255.0 blue:244/255.0 alpha:1]


#define WHITE50 [[UIColor alloc] initWithWhite:1.0 alpha:0.7]
#define WHITE15 [[UIColor alloc] initWithWhite:1.0 alpha:0.15]
#define WHITE25 [[UIColor alloc] initWithWhite:1.0 alpha:0.25]
#define WHITE30 [[UIColor alloc] initWithWhite:1.0 alpha:0.30]



#pragma mark FONT
#define TITLE_FONT [UIFont boldSystemFontOfSize:15]
#define BIG_TITEL_FONT [UIFont boldSystemFontOfSize:20]
#define BUTTON_FONT [UIFont systemFontOfSize:18]
#define NORMAL_FONT [UIFont systemFontOfSize:15]
#define SMALL_FONT [UIFont boldSystemFontOfSize:11]

#pragma mark UIDeviceInfo
#define OS_VERSION [[UIDevice alloc] init].systemVersion


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

typedef NS_ENUM(NSInteger, NavBarButtonType)
{
    NavBarButtonTypeSet = 3,
    NavBarButtonTypeMenu = 6,
    NavBarButtonTypeBack = 7
};

@protocol QCSYWebViewDelegate <NSObject>

-(void)recordBrowse:(NSString*)url;

@end
@protocol HandlerDelegate <NSObject>

-(NSMutableDictionary*)getHandlerList;

@end