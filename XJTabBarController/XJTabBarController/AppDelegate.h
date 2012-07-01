//
//  AppDelegate.h
//  XJTabBarController
//
//  Created by xj guo on 12-7-1.
//  Copyright (c) 2012年 51.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,XJTabBarControllerDelegate> {
    XJTabBarController *_tabBarController;
}

@property (nonatomic,retain) UIWindow *window;
@property (nonatomic,retain) XJTabBarController *tabBarController;
@end
