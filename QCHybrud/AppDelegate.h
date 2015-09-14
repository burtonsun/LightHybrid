//
//  AppDelegate.h
//  QCHybrud
//
//  Created by Burton on 15/3/16.
//  Copyright (c) 2015年 Burton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,retain) CLLocationManager *locationManager;
-(NSString*)getToken;

@end

