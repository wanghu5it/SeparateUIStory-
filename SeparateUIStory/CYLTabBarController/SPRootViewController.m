//
//  SPRootViewController.m
//  SeparateUIStory
//
//  Created by wangfei on 16/1/26.
//  Copyright © 2016年 wanghu. All rights reserved.
//

#import "SPRootViewController.h"

@interface SPRootViewController ()<UIGestureRecognizerDelegate>


@end

@implementation SPRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.scaleContentView = NO;
    self.scaleMenuView = NO;
    self.panFromEdge = NO;
    self.panGestureEnabled = NO;
    
    // 移除手势
    for (UIPanGestureRecognizer *pangesture in [[self view]gestureRecognizers]) {
        
        [[self view]removeGestureRecognizer:pangesture];
    }
    
    self.parallaxEnabled = NO;
    self.interactivePopGestureRecognizerEnabled = NO;
    self.contentViewShadowEnabled = NO;
    

}
- (void)awakeFromNib{
    
    //        self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CYLTabBar"];
    self.contentViewController = [self setupTabController];
    //这个是侧滑的时候左面的按钮
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftSideView"];
}
#  pragma mark 特别进行说明这是要侧滑的主体框架2
-(CYLTabBarController *)setupTabController
{
    self.taBarController=[[CYLTabBarController alloc]init];
    UIViewController  *home=[[UIStoryboard storyboardWithName:@"Home" bundle:nil]instantiateInitialViewController];
    UIViewController  *Customer=[[UIStoryboard storyboardWithName:@"Customer" bundle:nil]instantiateInitialViewController];
    UIViewController  *Pay=[[UIStoryboard storyboardWithName:@"Pay" bundle:nil]instantiateInitialViewController];
    UIViewController  *my=[[UIStoryboard storyboardWithName:@"My" bundle:nil]instantiateInitialViewController];
    NSArray *tabBarItemsAttributes = @[
                                       @{
                                           CYLTabBarItemTitle : @"首页",
                                           CYLTabBarItemImage : @"HomePage_normal.png",
                                           CYLTabBarItemSelectedImage : @"HomePage_highlight.png",
                                           },
                                       @{
                                           CYLTabBarItemTitle : @"客户",
                                           CYLTabBarItemImage : @"Customer_normal.png",
                                           CYLTabBarItemSelectedImage : @"Customer_highlight.png",
                                           },
                                       @{
                                           CYLTabBarItemTitle : @"支付",
                                           CYLTabBarItemImage : @"Pay_normal.png",
                                           CYLTabBarItemSelectedImage : @"Pay_highlight.png",
                                           },
                                       @{
                                           CYLTabBarItemTitle : @"我",
                                           CYLTabBarItemImage : @"My_normal.png",
                                           CYLTabBarItemSelectedImage : @"My_highlight.png"
                                           },
                                       
                                       ];
    
    self.taBarController.tabBarItemsAttributes = tabBarItemsAttributes;
    [self.taBarController setViewControllers:@[home, Customer, Pay, my]];
    return self.taBarController;
    
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
