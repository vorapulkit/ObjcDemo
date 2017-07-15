//
//  AppDelegate.h
//  DemoObjc
//
//  Created by Pulkit on 7/5/17.
//  Copyright © 2017 Pulkeet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    BOOL isNetAvailable,changeReachability;
}

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,retain) Reachability *hostReachability;
@property (nonatomic,retain) Reachability *internetReachability;
@property (nonatomic,retain) Reachability *wifiReachability;


@end

