//
//  XJTabBar.h
//  XJTabBarController
//
//  Created by xj guo on 12-7-1.
//  Copyright (c) 2012年 51.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XJTabBarDelegate;

@interface XJTabBar : UIView
{
	UIImageView *_backgroundView;
	id<XJTabBarDelegate> _delegate;
	NSMutableArray *_buttons;
}
@property (nonatomic, retain) UIImageView *backgroundView;
@property (nonatomic, assign) id<XJTabBarDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *buttons;


- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray;
- (void)selectTabAtIndex:(NSInteger)index;
- (void)removeTabAtIndex:(NSInteger)index;
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;
- (void)setBackgroundImage:(UIImage *)img;
@end
@protocol XJTabBarDelegate<NSObject>
@optional
- (BOOL)tabBar:(XJTabBar *)tabBar shouldSelectIndex:(NSInteger)index;
@required
- (void)tabBar:(XJTabBar *)tabBar didSelectIndex:(NSInteger)index; 
@end
