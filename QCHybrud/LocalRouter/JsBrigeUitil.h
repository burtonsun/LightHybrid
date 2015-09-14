//
//  JsBrigeUitil.h
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIWebView(JsBrigeUitil)

-(BOOL)doJsWithName:(NSString*)jsCallBackName data:(NSData*)data;

@end

@interface UIWebView(LoadLoaclDataUtil)
-(void)loadLocalData:(NSString*)url;
-(void)loadLocalPage:(NSString*)url;
@end

@interface NSObject(ReflectObj)
- (NSDictionary*)getObjectData;
@end
//@interface JsBrigeUitil : NSObject
//+(BOOL)doJsWithName:(NSString*)jsCallBackName data:(NSData*)data;
//@end
