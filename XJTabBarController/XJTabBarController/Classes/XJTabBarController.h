//
//  XJTabBarController.h
//  XJTabBarController
//
//  Created by xj guo on 12-7-1.
//  Copyright (c) 2012年 51.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJTabBar.h"

@protocol XJTabBarControllerDelegate;
@interface XJTabBarController : UIViewController <XJTabBarDelegate>
{
	XJTabBar *_tabBar;
	UIView      *_containerView;
	UIView		*_transitionView;
	id<XJTabBarControllerDelegate> _delegate;
	NSMutableArray *_viewControllers;
	NSUInteger _selectedIndex;
	
	BOOL _tabBarTransparent;
	BOOL _tabBarHidden;
}

@property(nonatomic, copy) NSMutableArray *viewControllers;

@property(nonatomic, readonly) UIViewController *selectedViewController;
@property(nonatomic) NSUInteger selectedIndex;

// Apple is readonly
@property (nonatomic, readonly) XJTabBar *tabBar;
@property(nonatomic,assign) id<XJTabBarControllerDelegate> delegate;


// Default is NO, if set to YES, content will under tabbar
@property (nonatomic) BOOL tabBarTransparent;
@property (nonatomic) BOOL tabBarHidden;

- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr;

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;

// Remove the viewcontroller at index of viewControllers.
- (void)removeViewControllerAtIndex:(NSUInteger)index;

// Insert an viewcontroller at index of viewControllers.
- (void)insertViewController:(UIViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;
- (void)setTabItemEnable:(BOOL)enable atIndex:(NSUInteger)index;
@end


@protocol XJTabBarControllerDelegate <NSObject>
@optional
- (BOOL)tabBarController:(XJTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
- (void)tabBarController:(XJTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end

@interface UIViewController (XJTabBarControllerSupport)
@property(nonatomic, retain, readonly) XJTabBarController *XJTabBarController;
@end

