//
//  LocalRouter.m
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "LocalRouter.h"
#import "HandlerCenter.h"
#import "BaseHandlerList.h"
#import "JSONKit.h"
#import "JsBrigeDefine.h"
@interface LocalRouter()
{

}
@end

static LocalRouter* router = nil;
@implementation LocalRouter

-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

+(instancetype)shareLocatRouter
{
    static dispatch_once_t shareCount;
    dispatch_once(&shareCount, ^{
        if (router == nil)
        {
            router = [[LocalRouter alloc] init];
        }
        
    });
    return router;
}

-(BOOL)doActionType: (NSString *)handlerType
           funcName:(NSString*)funcName
          funcParam:(NSString*)funcParam
           callBack:(NSString*)callBack
       callBackDataNeed:(BOOL)isNeed
{
    NSInteger serviceType = [handlerType integerValue];
    if (!self.handlerCenter)
    {
        return false;
    }
    BaseHandlerList *service;
    switch (serviceType)
    {
        case NetService:
            service = (BaseHandlerList*)[self.handlerCenter.allHandlerDic objectForKey:[NSNumber numberWithInt:NetService]];
            break;
        case DataService:
            service = (BaseHandlerList*)[self.handlerCenter.allHandlerDic objectForKey:[NSNumber numberWithInt:DataService]];
            break;
        case UIService:
            service = (BaseHandlerList*)[self.handlerCenter.allHandlerDic objectForKey:[NSNumber numberWithInt:UIService]];
            break;
        case DeviceService:
            service = (BaseHandlerList*)[self.handlerCenter.allHandlerDic objectForKey:[NSNumber numberWithInt:DeviceService]];
            break;
        default:
            return false;
            break;
    }
    
    if (service)
    {
        self.delegate = service;
        handleBlock handle = [[self.delegate getHandlerList] objectForKey:funcName];
        if (handle)
        {
            if (funcParam && callBack)
            {
                handle((NSDictionary*)[funcParam objectFromJSONString],callBack,isNeed,self.runWebView);
            }
            else if (funcParam)
            {
                handle((NSDictionary*)[funcParam objectFromJSONString],nil,false,self.runWebView);
            }else if(callBack)
            {
                handle(nil,callBack,isNeed,self.runWebView);
            }else
            {
                handle(nil,nil,false,self.runWebView);
            }
        }
    }else
    {
        NSLog(@"!!!!未提供该本地服务:%ld.!!!!",(long)serviceType);
        return false;
    }
    return true;
}

-(BOOL)routeUrl:(NSURLRequest*)url
{
    if (url && url.URL)
    {
        NSLog(@"Begin route url:%@",url.URL.absoluteString);
        NSString *schame = url.URL.scheme;
        if ([schame isEqualToString:JS_REQUEST_SCHAME])
        {
            NSString *path = url.URL.path;
            NSString *host = url.URL.host;
            NSString *handlerTyep = nil;
            if (host)
            {
                handlerTyep = host;
            }
            
            if (path)
            {
                if([path hasPrefix:@"/"])
                {
                    path = [path substringFromIndex:1];
                }
                
                NSArray * parameter = [path componentsSeparatedByString:@"/"];
                if (parameter.count >= 1)
                {
                    NSString *funcName = parameter[0];
                    NSString *funcParam = nil;
                    NSString *callBack = nil;
                    BOOL callBackDataNeed = false;

                    if (parameter.count>=2)
                    {
                        if(![parameter[1] isEqualToString:NO_PARAM])
                        {
                            callBack = parameter[1];
                        }
                    }
                    
                    if (parameter.count == 3 )
                    {
                        if([parameter[2] isEqualToString:NO_PARAM])
                        {
                            callBackDataNeed = false;
                        }else
                        {
                            callBackDataNeed = true;
                        }
                    }
                    
                    if(parameter.count >= 3)
                    {
                        unsigned long length = funcName.length + callBack.length + ((NSString*)parameter[2]).length +3;
                        
                        funcParam = [path substringFromIndex:length];
                    }


                    NSLog(@"do Action with Type:%@ with name:%@ with Param:%@ with callBack:%@",handlerTyep,funcName,funcParam,callBack);
                    return [self doActionType:handlerTyep funcName:funcName funcParam:funcParam callBack:callBack callBackDataNeed:callBackDataNeed];
                }
            }
        }
        return false;
    }else
    {
        return false;
    }
}

@end
