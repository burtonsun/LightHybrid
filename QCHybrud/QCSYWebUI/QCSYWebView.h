//
//  QCSYWebView.h
//  QCHybrud
//
//  Created by Burton on 15/3/16.
//  Copyright (c) 2015年 Burton. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JsBrigeDefine.h"
@interface QCSYWebView : UIWebView

@property(nonatomic,weak)UIViewController *containViewController;
@property(nonatomic,retain)NSString *beginUrl;
@property(nonatomic,weak)id<QCSYWebViewDelegate>delegateRecord;
-(id)initWithContainVC:(UIViewController*)containViewController;
-(id)initWithContainVC:(UIViewController*)containViewController beginUrl:(NSString*)url;
@end
