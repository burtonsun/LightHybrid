//
//  QCSYWebView.m
//  QCHybrud
//
//  Created by Burton on 15/3/16.
//  Copyright (c) 2015年 Burton. All rights reserved.
//

#import "QCSYWebView.h"

@implementation QCSYWebView
-(id)initWithContainVC:(UIViewController*)containViewController
{
    self = [super init];
    if (self)
    {
        self.scalesPageToFit = false;
        self.containViewController = containViewController;
        self.scrollView.bounces = false;
        self.scrollView.bouncesZoom = false;
        self.scrollView.alwaysBounceHorizontal = false;
        self.scrollView.alwaysBounceVertical = false;
        self.scrollView.scrollEnabled = false;
    }
    return self;
}
-(id)initWithContainVC:(UIViewController*)containViewController beginUrl:(NSString*)url
{
    self = [super init];
    if (self)
    {
        self.scalesPageToFit = false;
        self.containViewController = containViewController;
        self.beginUrl = url;
        self.scrollView.bounces = false;
        self.scrollView.bouncesZoom = false;
        self.scrollView.alwaysBounceHorizontal = false;
        self.scrollView.alwaysBounceVertical = false;
        self.scrollView.scrollEnabled = false;
    }
    return self;
}
@end
