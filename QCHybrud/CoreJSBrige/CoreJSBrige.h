//
//  CoreJSBrige.h
//  hybirdDemo
//
//  Created by user on 15/1/4.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalRouter.h"
#import <UIKit/UIKit.h>

@interface CoreJSBrige : NSObject<UIWebViewDelegate>

@property(nonatomic,retain)LocalRouter* route;

+(instancetype)shareInstance;
+(NSString*)localImgFilePath;
+(NSString*)localDataFilePath;
@end
