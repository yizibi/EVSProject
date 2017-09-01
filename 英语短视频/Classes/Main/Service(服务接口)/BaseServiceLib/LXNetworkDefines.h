//
//  LXNetworkDefines.h
//  英语短视频
//
//  Created by 李lucy on 2017/8/31.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#ifndef LXNetworkDefines_h
#define LXNetworkDefines_h


/**
 *  请求类型
 */
typedef NS_ENUM(NSInteger,NetWorkType) {
    /**< GET请求 */
    NetWorkGET = 1,
     /**< POST请求 */
    NetWorkPOST
    
};


/**
 *  网络请求超时的时间
 */
#define API_TIME_OUT 60

/**
 *  socket连接超时的时间
 */
#define SOCKET_TIME_OUT 60
/**
 *  网络请求重新尝试的次数
 */
#define NetWorkRetryTimes     2

#if NS_BLOCKS_AVAILABLE

/**
 *  请求开始的回调（下载时用到）
 */
typedef void (^NWStartBlock)(void);

/**
 *  请求成功回调
 *
 *  @param returnData 回调block
 */
typedef void (^NWSuccessBlock)(id returnData);

/**
 *  请求失败回调
 *
 *  @param error 回调block
 */
typedef void (^NWFailureBlock)(NSError *error);
#endif


#endif /* LXNetworkDefines_h */
