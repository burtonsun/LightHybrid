//
//  DelegateObject.h
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseHandlerList.h"
@interface DelegateObject : NSObject<UIImagePickerControllerDelegate>
@property(nonatomic,weak)UIWebView *runWebView;
@property(nonatomic,copy)NSString *callBackName;
@property(nonatomic,retain)BaseHandlerList *handler;
-(void)setWebViewDelegate;
-(void)runJSWith:(NSString*)data;
-(void)runJS;
-(id)initWihtHandlerList:(BaseHandlerList*)handler;
-(void)runAfterDelegateUse:(UIWebView*)runWebView callBackName:(NSString*)jsCallBackName;
@end
