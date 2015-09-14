//
//  ViewController.m
//  QCHybrud
//
//  Created by Burton on 15/3/16.
//  Copyright (c) 2015年 Burton. All rights reserved.
//

#import "ViewController.h"
#import "CoreJSBrige.h"
#import "HandlerCenter.h"
#import "QCSYWebView.h"
@interface ViewController ()
{
    CoreJSBrige *_jsBrige;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.webView = [[UIWebView alloc] init];
    self.webView = [[QCSYWebView alloc] initWithContainVC:self];
    self.webView.frame = self.view.bounds;
    [self.view addSubview:self.webView];
    _jsBrige = [CoreJSBrige shareInstance];
    HandlerCenter *center = [HandlerCenter shareInstance];
    _jsBrige.route.handlerCenter = center;
    self.webView.delegate = _jsBrige;
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.baidu.com"];
    NSURLRequest *requset = [[NSURLRequest alloc] initWithURL:url];
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(100, 100, 100, 30);
    back.backgroundColor = [UIColor blackColor];
    [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *forwd = [UIButton buttonWithType:UIButtonTypeCustom];
    forwd.frame = CGRectMake(100, 130, 100, 30);
    forwd.backgroundColor = [UIColor greenColor];
    [forwd addTarget:self action:@selector(forwd:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:back];
    [self.view addSubview:forwd];
    [self.view bringSubviewToFront:back];
    [self.view bringSubviewToFront:forwd];

}
-(void)back:(id)sender
{
    if (self.webView.canGoBack)
    {
        [self.webView goBack];
    }
}
-(void)forwd:(id)sender
{
    if (self.webView.canGoForward)
    {
        [self.webView goForward];
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    self.webView.delegate = _jsBrige;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSData* data = [[NSData alloc]initWithContentsOfFile:path];
    [self.webView loadData:data MIMEType:nil textEncodingName:nil baseURL:nil];
}
-(void)viewDidDisappear:(BOOL)animated
{
   // self.webView.delegate = nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
