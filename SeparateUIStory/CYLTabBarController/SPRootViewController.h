//
//  SPRootViewController.h
//  SeparateUIStory
//
//  Created by wangfei on 16/1/26.
//  Copyright © 2016年 wanghu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
#import "CYLTabBarController.h"
@interface SPRootViewController : RESideMenu
//特别进行说明这是要侧滑的主体框架1
@property(nonatomic,strong)CYLTabBarController  *taBarController;
@end
