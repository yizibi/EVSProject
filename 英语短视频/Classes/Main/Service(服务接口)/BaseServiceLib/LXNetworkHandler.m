//
//  LXNetworkHandler.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/31.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "LXNetworkHandler.h"

@implementation LXNetworkHandler

+ (LXNetworkHandler *) sharedInstance
{
    static LXNetworkHandler * handler = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        handler = [[LXNetworkHandler alloc] init];
    });
    
    return handler;
}

- (BOOL)cancelForDelegate:(id)delelgate
{
    NSUInteger hashValue = [delelgate hash];
    
    BOOL flag = NO;
    
    for (LXNetworkItem *item in self.networkItems)
    {
        if (item.hashValue == hashValue)
        {
            [self removeItem:item];
            flag = YES;
        }
    }
    
    return flag;
}

- (void)addItem:(LXNetworkItem *)networkItem
{
    if (networkItem.showHUD)
    {
        _showHUDReqCount++;
        
        if (_showHUDReqCount == 1)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:DEFN_SHOW_HUD object:nil];
        }
    }
    
    [self.networkItems addObject:networkItem];
}

- (void)removeItem:(LXNetworkItem *)networkItem
{
    if (networkItem.showHUD)
    {
        _showHUDReqCount--;
        
        if (_showHUDReqCount == 0)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:DEFN_HIDE_HUD object:nil];
        }
    }
    
    [self.networkItems removeObject:networkItem];
}


- (NSUInteger)conURL:(NSString *) url
         networkType:(NetWorkType) networkType
              params:(NSMutableDictionary *) params
            delegate:(id) delegate
             showHUD:(BOOL) showHUD
        successBlock:(NWSuccessBlock) successBlock
        failureBlock:(NWFailureBlock) failureBlock
{
    /// 如果有一些公共处理，可以写在这里
    
    NSUInteger hashValue = [delegate hash];
    LXNetworkItem *item = [[LXNetworkItem alloc] initWithtype:networkType
                                                          url:url
                                                       params:params
                                                     delegate:delegate
                                                    hashValue:hashValue
                                                      showHUD:showHUD
                                                 successBlock:successBlock
                                                 failureBlock:failureBlock];
    return item.hashValue;
}

- (NSUInteger)conURL:(NSString *) url
         networkType:(NetWorkType) networkType
              params:(NSMutableDictionary *) params
              images:(NSDictionary *) images
            delegate:(id) delegate
             showHUD:(BOOL) showHUD
        successBlock:(NWSuccessBlock) successBlock
        failureBlock:(NWFailureBlock) failureBlock
{
    NSUInteger hashValue = [delegate hash];
    LXNetworkItem *item = [[LXNetworkItem alloc] initWithtype:networkType
                                                          url:url
                                                       params:(NSMutableDictionary *) params
                                                       images:images
                                                     delegate:delegate
                                                    hashValue:hashValue
                                                      showHUD:showHUD
                                                 successBlock:successBlock
                                                 failureBlock:failureBlock];
    return item.hashValue;
}

- (NSUInteger)downloadURL:(NSString *) url
                 delegate:(id) delegate
               startBlock:(NWStartBlock) startBlock
             successBlock:(NWSuccessBlock) successBlock
             failureBlock:(NWFailureBlock) failureBlock
{
#if DEBUG_LOG
    NSLog(@"LX网络下载url:%@", url);
#endif
    
    NSUInteger hashValue = [delegate hash];
    LXNetworkItem *item = [[LXNetworkItem alloc] initDownloadWithtype:NetWorkPOST
                                                                  url:url
                                                             delegate:delegate
                                                            hashValue:hashValue
                                                           startBlock:startBlock
                                                         successBlock:successBlock
                                                         failureBlock:failureBlock];
    return item.hashValue;
}

@end
