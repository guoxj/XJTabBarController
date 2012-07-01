//
//  AppDelegate.m
//  XJTabBarController
//
//  Created by xj guo on 12-7-1.
//  Copyright (c) 2012年 51.com. All rights reserved.
//

#import "AppDelegate.h"
#import "VCOneViewController.h"
#import "VCTwoViewController.h"
#import "VCThreeViewController.h"
#import "VCFourViewController.h"
#import "VCFiveViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if([[UINavigationBar class] respondsToSelector:@selector(appearance)])
	{
        UIImage *image = [UIImage imageNamed:@"global_titlebarbg.png"];
        [[UINavigationBar appearance] setBackgroundImage:image 
                                           forBarMetrics:UIBarMetricsDefault];
	}
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    VCOneViewController *oneTabViewController = [[[VCOneViewController alloc] init] autorelease];
    UINavigationController *oneNavC = [[[UINavigationController alloc] initWithRootViewController:oneTabViewController] autorelease];
    
    VCTwoViewController *twoTabViewController = [[[VCTwoViewController alloc] init] autorelease];
    UINavigationController *twoNavC = [[[UINavigationController alloc] initWithRootViewController:twoTabViewController] autorelease];
    
    VCThreeViewController *threeTabViewController = [[[VCThreeViewController alloc] init] autorelease];
    UINavigationController *threeNavC = [[[UINavigationController alloc] initWithRootViewController:threeTabViewController] autorelease];
    
    VCFourViewController *fourTabViewController = [[[VCFourViewController alloc] init] autorelease];
    UINavigationController *fourNavC = [[[UINavigationController alloc] initWithRootViewController:fourTabViewController] autorelease];
    
    VCFiveViewController *fiveTabViewController = [[[VCFiveViewController alloc] init] autorelease];
    UINavigationController *fiveNavC = [[[UINavigationController alloc] initWithRootViewController:fiveTabViewController] autorelease];
    
    NSArray *ctrlArr = [NSArray arrayWithObjects:oneNavC, twoNavC, threeNavC, fourNavC, fiveNavC,nil];
    
	NSMutableDictionary *imgDic1 = [NSMutableDictionary dictionaryWithCapacity:2];
	[imgDic1 setObject:[UIImage imageNamed:@"today_tab_0.png"] forKey:@"Default"];
	[imgDic1 setObject:[UIImage imageNamed:@"today_tab_1.png"] forKey:@"Seleted"];
    
    NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:2];
	[imgDic2 setObject:[UIImage imageNamed:@"nearby_tab_0.png"] forKey:@"Default"];
	[imgDic2 setObject:[UIImage imageNamed:@"nearby_tab_1.png"] forKey:@"Seleted"];
    [imgDic2 setObject:[UIImage imageNamed:@"nearby_tab_0_disable.png"] forKey:@"Disable"];
    
	NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:2];
	[imgDic3 setObject:[UIImage imageNamed:@"topic_tab_0.png"] forKey:@"Default"];
	[imgDic3 setObject:[UIImage imageNamed:@"topic_tab_1.png"] forKey:@"Seleted"];
    
    NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:2];
	[imgDic4 setObject:[UIImage imageNamed:@"favorite_tab_0.png"] forKey:@"Default"];
	[imgDic4 setObject:[UIImage imageNamed:@"favorite_tab_1.png"] forKey:@"Seleted"];
    
	NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:2];
	[imgDic5 setObject:[UIImage imageNamed:@"setting_tab_0.png"] forKey:@"Default"];
	[imgDic5 setObject:[UIImage imageNamed:@"setting_tab_1.png"] forKey:@"Seleted"];
	
	NSArray *imgArr = [NSArray arrayWithObjects: imgDic1, imgDic2, imgDic3, imgDic4, imgDic5, nil];
	
	self.tabBarController = [[[XJTabBarController alloc] initWithViewControllers:ctrlArr imageArray:imgArr] autorelease];
    self.tabBarController.delegate = self;
	[self.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"global_tabbarbg.png"]];
	[self.tabBarController setTabBarTransparent:YES];
    [self.tabBarController setTabItemEnable:NO atIndex:1];
    
    _window.rootViewController = self.tabBarController;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -
- (BOOL)tabBarController:(XJTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}
- (void)tabBarController:(XJTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"%@",viewController);
}
@end
