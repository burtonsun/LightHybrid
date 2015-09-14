//
//  JsBrigeUitil.m
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "JsBrigeUitil.h"
#import "CoreJSBrige.h"
#import <objc/runtime.h>
@implementation UIWebView(JsBrigeUitil)
-(BOOL)doJsWithName:(NSString*)jsCallBackName data:(NSData*)data
{
    return true;
}
@end

@implementation UIWebView (LoadLoaclDataUtil)
-(void)loadLocalData:(NSString*)url
{
    const NSString * urls = [NSString stringWithUTF8String:[url UTF8String]];
    NSArray *urlArray = [urls componentsSeparatedByString:@"//"];
    NSArray *fileArray = [[urlArray lastObject] componentsSeparatedByString:@"."];
    if (fileArray.count == 2)
    {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:fileArray[0] ofType:fileArray[1]];
        NSRange pathR = [fileArray[0] rangeOfString:@"/" options:NSBackwardsSearch];
       
        NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        
        NSURL *baseURL = nil;
        if (pathR.length != 0) {
             NSString *p = [fileArray[0] substringToIndex:pathR.location];
            baseURL = [NSURL fileURLWithPath:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:p]];
        }else{
            baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
        }
        [self loadHTMLString:htmlString baseURL:baseURL];
    }
    if (!self.delegate)
    {
        self.delegate = [CoreJSBrige shareInstance];
    }
}


-(void)loadLocalPage:(NSString*)url
{
    if ([url hasPrefix:LOCAL_PAGE_PREFIX])
    {
        NSString *hostPath = [url substringFromIndex:12];
        if (hostPath)
        {
            NSArray *urlArray = [hostPath componentsSeparatedByString:@"."];
            if ([urlArray count]==2)
            {
                NSString *path = [[NSBundle mainBundle] pathForResource:urlArray[0] ofType:urlArray[1]];
                NSRange pathR = [hostPath rangeOfString:@"/" options:NSBackwardsSearch];
                
                NSURL *baseURL = nil;
                if (pathR.length != 0) {
                    NSString *p = [hostPath substringToIndex:pathR.location];
                    baseURL = [NSURL fileURLWithPath:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:p]];
                }else{
                    baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
                }
                
                NSData *data = [[NSData alloc] initWithContentsOfFile:path];
                [self loadData:data MIMEType:MINE_TYPE textEncodingName:nil baseURL:baseURL];
            }
        }
    }
    if (!self.delegate)
    {
        self.delegate = [CoreJSBrige shareInstance];
    }
}
@end

@implementation NSObject (ReflectObj)
- (NSDictionary*)getObjectData
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([self class], &propsCount);//获得属性列表
    for(int i = 0;i < propsCount; i++)
    {
        objc_property_t prop = props[i];
        
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];//获得属性的名称
        id value = [self valueForKey:propName];//kvc读值
        if(value == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self getObjectInternal:value];//自定义处理数组，字典，其他类
        }
        [dic setObject:value forKey:propName];
    }
    return dic;
}

-(id)getObjectInternal:(id)obj
{
    if([obj isKindOfClass:[NSString class]]
       || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]])
    {
        return obj;
    }
    
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for(NSString *key in objdic.allKeys)
        {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData];
}

@end
