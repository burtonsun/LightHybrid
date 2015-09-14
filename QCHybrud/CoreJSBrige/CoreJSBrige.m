//
//  CoreJSBrige.m
//  hybirdDemo
//
//  Created by user on 15/1/4.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "CoreJSBrige.h"
#import "LocalRouter.h"
#import "JsBrigeDefine.h"
#import "JsBrigeUitil.h"
@interface CoreJSBrige ()
{
    
}

@end

static CoreJSBrige *centerJSBrige = nil;

@implementation CoreJSBrige

-(id)init
{
    self = [super init];
    if (self)
    {
        self.route = [[LocalRouter alloc] init];
    }
    return self;
}

+(instancetype)shareInstance
{
    static dispatch_once_t once_instance;
    dispatch_once(&once_instance, ^{
        if (centerJSBrige == nil)
        {
            centerJSBrige = [[CoreJSBrige alloc] init];
        }
    });
    return centerJSBrige;
}

+(NSString*)localImgFilePath
{
    NSString *filePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"LocalImg"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:true attributes:nil error:nil];
    }
    return filePath;
}

+(NSString*)localDataFilePath
{
    NSString *filePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingString:@"LocalData"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:true attributes:nil error:nil];
    }
    return filePath;
}
#pragma mark UIWebViewDeleagte

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"_____________will start load url:%@_______________",request.URL.absoluteString);
    if ([request.URL.scheme isEqualToString:JS_REQUEST_SCHAME])
    {
        webView.delegate= nil;
        self.route.runWebView = webView;
        [self.route routeUrl:request];
        return false;
    }
    if ([request.URL.scheme isEqualToString:APPLE_DATA_SCHAME])
    {
        webView.delegate= nil;
        [webView loadLocalData:request.URL.absoluteString];
        return false;
    }
    if([request.URL.scheme isEqualToString:LOCAL_PAGE_PREFIX])
    {
        webView.delegate = nil;
        [webView loadLocalPage:request.URL.absoluteString];
        return false;
    }


    return true;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"________Load Web Data_________");
    //CoreJsBrige.js注入

    NSLog(@"CoreJSBrige注入");

}
    
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //[webView stringByEvaluatingJavaScriptFromString:@"window.coreJSBrige.callJsService(\"registerTest\");"];
    NSLog(@"________Finished Load Web Data_________");
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"________Fail Load Web Data________");
    NSLog(@"%@",error);
}

@end


