//
//  AppDelegate.h
//  SeparateUIStory
//
//  Created by wangfei on 16/1/26.
//  Copyright © 2016年 wanghu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYLTabBarController.h"  //特别进行说明这是不要侧滑的主体框架1

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//特别进行说明这是不要侧滑的主体框架1
@property(nonatomic,strong)CYLTabBarController  *taBarController;
@end

