//
//  AppDelegate.m
//  英语短视频
//
//  Created by hspcadmin on 2017/8/21.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "AppDelegate.h"
#import "EVSHomeController.h"
#import "EVSNavgationController.h"


@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    
    self.window.rootViewController = [[EVSNavgationController alloc] initWithRootViewController:[[EVSHomeController alloc] init]];
    
    
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    
}


- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
