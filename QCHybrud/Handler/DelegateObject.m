//
//  DelegateObject.m
//  hybirdDemo
//
//  Created by Burton on 15/3/13.
//  Copyright (c) 2015年 user. All rights reserved.
//

#import "DelegateObject.h"
#import "CoreJSBrige.h"
#import "JSONKit.h"
@implementation DelegateObject

-(id)initWihtHandlerList:(BaseHandlerList*)handler
{
    self = [super init];
    if (self)
    {
        self.handler = handler;
    }
    return self;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:true completion:^{
        [self performSelector:@selector(runJS) withObject:nil afterDelay:0];
    }];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [picker dismissViewControllerAnimated:true completion:^{
        [self.handler setRunView:self.runWebView Delegate:[CoreJSBrige shareInstance]];
        if (self.runWebView && self.callBackName)
        {
            NSData *data = UIImageJPEGRepresentation(image, 0.5);
    
            NSDate *time = [NSDate dateWithTimeIntervalSinceNow:0];
            NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[time timeIntervalSince1970]];
            
             NSString *imgStr = [[CoreJSBrige  localImgFilePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg",timeSp]];
            
            [[NSFileManager defaultManager] createFileAtPath:imgStr contents:data attributes:nil];
            
            imgStr = [imgStr JSONString];
            [self performSelector:@selector(runJSWith:) withObject:imgStr afterDelay:0];
        }
    }];
}

-(void)runJS
{
    NSLog(@"%@", [self.runWebView stringByEvaluatingJavaScriptFromString:[self getCallJsString:self.callBackName Data:nil]]);
    [self performSelector:@selector(setWebViewDelegate) withObject:nil afterDelay:1];
}

-(void)runJSWith:(NSString*)data
{
    NSLog(@"%@", [self.runWebView stringByEvaluatingJavaScriptFromString:[self getCallJsString:self.callBackName Data:data]]);
    [self performSelector:@selector(setWebViewDelegate) withObject:nil afterDelay:1];

}

-(void)setWebViewDelegate
{
    [self.handler setRunView:self.runWebView Delegate:[CoreJSBrige shareInstance]];
}

-(NSString *)getCallJsString:(NSString *)callBackName Data:(NSString*)data
{
    if (data&&callBackName)
    {
        NSLog(@"%@",[NSString stringWithFormat:@"var b = '%@';window.coreJSBrige.callJsService(\"%@\",b);",data,callBackName]);
        return [NSString stringWithFormat:@"var b = '%@';window.coreJSBrige.callJsService(\"%@\",b);",data,callBackName];
    }else if(callBackName)
    {
        return [NSString stringWithFormat:@"window.coreJSBrige.callJsService(\"%@\");",callBackName];
    }
    return nil;
}

-(void)runAfterDelegateUse:(UIWebView*)runWebView callBackName:(NSString*)jsCallBackName
{
    self.runWebView = runWebView;
    self.callBackName = jsCallBackName;
}
@end
