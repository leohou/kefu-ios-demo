//
//  AppDelegate.m
//  CustomerSystem-ios
//
//  Created by dhc on 15/2/13.
//  Copyright (c) 2015年 easemob. All rights reserved.
//

#import "AppDelegate.h"


#import "LocalDefine.h"
#import "HomeViewController.h"
#import "AppDelegate+easemob.h"

@interface AppDelegate ()
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 初始化环信客服SDK，详细内容在AppDelegate+EaseMob.m 文件中
    [self easemobApplication:application didFinishLaunchingWithOptions:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.homeController = [[HomeViewController alloc] init];
   // [self.homeController networkChanged:eEMConnectionDisconnected];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.homeController];
    [self configureNavigationController:navigationController];
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    //
}

- (void)configureNavigationController:(UINavigationController *)navigationController
{
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0)
    {
        [[UINavigationBar appearance] setBarTintColor:RGBACOLOR(242, 83, 131, 1)];
        [[UINavigationBar appearance] setTitleTextAttributes:
        [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    }
    //设置7.0以下的导航栏
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0)
    {
        navigationController.navigationBar.barStyle = UIBarStyleDefault;
        [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"titleBar"] forBarMetrics: UIBarMetricsDefault];
        [navigationController.navigationBar.layer setMasksToBounds:YES];
    }
    
    
}

- (void)didConnectionStateChanged:(HConnectionState)aConnectionState
{
    
}

- (void)didAutoLoginWithError:(EMError *)aError
{
    
    
}

- (void)didLoginFromOtherDevice
{
    
}

- (void)didRemovedFromServer
{
    
}


@end
