//
//  LXNetworkHandler.h
//  英语短视频
//
//  Created by 李lucy on 2017/8/31.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXNetworkDefines.h"
#import "LXNetworkItem.h"


@interface LXNetworkHandler : NSObject

/**
 *  网络请求项的数组，储存当前正在请求中的那些网络请求项
 */
@property (nonatomic, strong) NSMutableArray *networkItems;

/**
 *  需要显示HUD的网络请求的个数
 */
@property (nonatomic, readonly) NSUInteger showHUDReqCount;

/**
 *  单例
 *
 *  @return LXNetworkHandler的单例对象
 */
+ (LXNetworkHandler *) sharedInstance;

/**
 *  取消网络请求
 *
 *  @param delelgate 网络请求的委托
 *
 *  @return 是否取消成功
 */
- (BOOL)cancelForDelegate:(id)delelgate;

/**
 *  添加一个网络请求项
 *
 *  @param networkItem 网络请求的委托
 */
- (void)addItem:(LXNetworkItem *)networkItem;

/**
 *  移除一个网络请求项
 *
 *  @param networkItem 网络请求的委托
 */
- (void)removeItem:(LXNetworkItem *)networkItem;

/**
 *  创建一个网络请求项
 *
 *  @param url          网络请求URL
 *  @param networkType  网络请求方式
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return 根据网络请求的委托delegate而生成的唯一标示
 */
- (NSUInteger)conURL:(NSString *) url
         networkType:(NetWorkType) networkType
              params:(NSMutableDictionary *) params
            delegate:(id) delegate
             showHUD:(BOOL) showHUD
        successBlock:(NWSuccessBlock) successBlock
        failureBlock:(NWFailureBlock) failureBlock;

/**
 *  创建一个网络请求项，开始上传图片
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param images       图片二进制数组
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return LXNetworkItem对象
 */
- (NSUInteger)conURL:(NSString *) url
         networkType:(NetWorkType) networkType
              params:(NSMutableDictionary *) params
              images:(NSDictionary *) images
            delegate:(id) delegate
             showHUD:(BOOL) showHUD
        successBlock:(NWSuccessBlock) successBlock
        failureBlock:(NWFailureBlock) failureBlock;

/**
 *  创建一个下载的网络请求项
 *
 *  @param url          下载地址URL
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param startBlock   请求开始后的block
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return 根据网络请求的委托delegate而生成的唯一标示
 */
- (NSUInteger)downloadURL:(NSString *) url
                 delegate:(id) delegate
               startBlock:(NWStartBlock) startBlock
             successBlock:(NWSuccessBlock) successBlock
             failureBlock:(NWFailureBlock) failureBlock;


@end
