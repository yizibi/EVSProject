//
//  LXNetworkItem.m
//  英语短视频
//
//  Created by 李lucy on 2017/8/31.
//  Copyright © 2017年 英语短视频. All rights reserved.
//

#import "LXNetworkItem.h"
#import "AppDelegate.h"
#import "LXNetworkHandler.h"

@implementation LXNetworkItem



#pragma mark - ssl验证
+ (AFSecurityPolicy*)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"cert1" ofType:@"pem"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    LXLog(@"证书的路径:%@  证书的数据:%@",certData,cerPath);
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    securityPolicy.pinnedCertificates = [NSSet setWithObject:certData];
    
    return securityPolicy;
}


- (LXNetworkItem *) initWithtype:(NetWorkType) networkType
                             url:(NSString *) url
                          params:(NSDictionary *) params
                        delegate:(id) delegate
                       hashValue:(NSUInteger) hashValue
                         showHUD:(BOOL) showHUD
                    successBlock:(NWSuccessBlock) successBlock
                    failureBlock:(NWFailureBlock) failureBlock
{
    if (self = [super init])
    {
        self.networkType = networkType;
        self.url = url;
        self.params = params;
        self.delegate = delegate;
        self.hashValue = hashValue;
        self.showHUD = showHUD;
        self.successBlock = successBlock;
        self.failureBlock = failureBlock;
        
        [[LXNetworkHandler sharedInstance] addItem:self];
        NSLog(@"BM网络请求接口url：%@\n参数：%@", url, params);
        
        
        if (showHUD)
        {
            
            [SVProgressHUD showWithStatus:@"加载中......"];
            
        }
        
        if (networkType == NetWorkGET)
        {
            
            
            NSString *URL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            AFHTTPSessionManager *manger        = [AFHTTPSessionManager manager];
            //            AFSecurityPolicy *policy            = [[AFSecurityPolicy alloc] init];
            //            [policy setAllowInvalidCertificates:YES];
            //            [manger setSecurityPolicy:policy];
            
            manger.requestSerializer            = [AFJSONRequestSerializer serializer];
            manger.responseSerializer           = [AFJSONResponseSerializer serializer];
            
            manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
          
            /*
            
            //系统版本
            NSString *osSysVersion = [[UIDevice currentDevice] systemVersion];
            
            //手机型号
            NSString *phoneModel = [LX_CommonManger getUserPhoneType];
            
            NSString *phoneVersion = [NSString stringWithFormat:@"iOS %@",osSysVersion];
            //系统时区
            NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得系统的时区
            NSString *systemZone = [NSString stringWithFormat:@"%@",zone];
            //语言环境
            //            NSArray *languageArray = [NSLocale preferredLanguages];
            //            NSString *language = [languageArray objectAtIndex:0];
            
            //程序版本
            NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];
            NSString *appVersion = [dicInfo objectForKey:@"CFBundleShortVersionString"];
            
            //时间戳
            NSDate *date = [NSDate date];
            NSString *nowDatw = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
            
            
            [manger.requestSerializer setValue:phoneVersion forHTTPHeaderField:@"os"];
            [manger.requestSerializer setValue:@"2" forHTTPHeaderField:@"userType"];
            [manger.requestSerializer setValue:phoneModel forHTTPHeaderField:@"phoneModel"];
            [manger.requestSerializer setValue:@"zh" forHTTPHeaderField:@"language_env"];
            [manger.requestSerializer setValue:systemZone forHTTPHeaderField:@"timeZone"];
            [manger.requestSerializer setValue:appVersion forHTTPHeaderField:@"appVersion"];
            [manger.requestSerializer setValue:nowDatw forHTTPHeaderField:@"timestamp"];
            
             */

            [manger.requestSerializer setValue:@"1.0.0" forHTTPHeaderField:@"_v"];
            [manger.requestSerializer setValue:@"iPhone6s" forHTTPHeaderField:@"imei"];
            [manger.requestSerializer setValue:@"ios" forHTTPHeaderField:@"clienttype"];
            
            //token you bichuan
//            [manger.requestSerializer setValue:@"" forHTTPHeaderField:@"token"];
            
            [manger GET:URL parameters:self.params progress:^(NSProgress * _Nonnull downloadProgress) {
                
                //进度
                
                
            } success:^(NSURLSessionDataTask *task, id responseObject) {
                
                
                
                NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:URL]];
                NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
                [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"Cookies"];
                
                
                if (self.successBlock)
                {
                  
                    
                    self.successBlock(responseObject);
                    
                    
                    if (showHUD)
                    {
                        [SVProgressHUD dismiss];
                    }
                }
                
                
                [[LXNetworkHandler sharedInstance] removeItem:self];
                
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                
               
                if (self.failureBlock) {
                    
                    self.failureBlock(nil);
                    
                    if (showHUD)
                    {
                        // 判断是否有网
                        //
                        //                        if ([XAppDelegate startRealTimeNetworkStatus])
                        //                        {
                        //                            [UnityLHClass showAlertView:@"亲,你的网络好像不给力哟"];
                        //
                        //
                        //                        }else{
                        //
                        //                            [UnityLHClass showAlertView:@"对不起,请检查你的网络."];
                        //
                        //
                        //                        }
                    }
                    
                } else {
                    
                    
                    [LXUnityclass showAlertView:@"亲,你的网络好像不给力哟"];
                    
                }
                
                
                if (showHUD)
                {
                    [SVProgressHUD dismiss];
                }
                [[LXNetworkHandler sharedInstance] removeItem:self];
            }];
            
        }
        else if (networkType == NetWorkPOST)
        {
            
            NSString *URL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
            
            //            AFSecurityPolicy *policy = [[AFSecurityPolicy alloc] init];
            //            [policy setAllowInvalidCertificates:YES];
            //            [manger setSecurityPolicy:policy];
            manger.requestSerializer = [AFJSONRequestSerializer serializer];
            manger.responseSerializer = [AFJSONResponseSerializer serializer];
            manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
            
           /*
            //系统版本
            NSString *osSysVersion = [[UIDevice currentDevice] systemVersion];
            
            //手机型号
            NSString *phoneModel = [LX_CommonManger getUserPhoneType];
            
            NSString *phoneVersion = [NSString stringWithFormat:@"iOS %@",osSysVersion];
            //系统时区
            NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得系统的时区
            NSString *systemZone = [NSString stringWithFormat:@"%@",zone];
            //语言环境
            //            NSArray *languageArray = [NSLocale preferredLanguages];
            //            NSString *language = [languageArray objectAtIndex:0];
            //程序版本
            NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];
            NSString *appVersion = [dicInfo objectForKey:@"CFBundleShortVersionString"];
            
            //时间戳
            NSDate *date = [NSDate date];
            NSString *nowDatw = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
            
            
            [manger.requestSerializer setValue:phoneVersion forHTTPHeaderField:@"os"];
            [manger.requestSerializer setValue:@"2" forHTTPHeaderField:@"userType"];
            [manger.requestSerializer setValue:phoneModel forHTTPHeaderField:@"phoneModel"];
            [manger.requestSerializer setValue:@"zh" forHTTPHeaderField:@"language_env"];
            [manger.requestSerializer setValue:systemZone forHTTPHeaderField:@"timeZone"];
            [manger.requestSerializer setValue:appVersion forHTTPHeaderField:@"appVersion"];
            [manger.requestSerializer setValue:nowDatw forHTTPHeaderField:@"timestamp"];
            */
            
            [manger.requestSerializer setValue:@"1.0.0" forHTTPHeaderField:@"_v"];
            [manger.requestSerializer setValue:@"iPhone6s" forHTTPHeaderField:@"imei"];
            [manger.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"clientType"];
            
            //token you bichuan
            //            [manger.requestSerializer setValue:@"" forHTTPHeaderField:@"token"];

            
            [manger POST:URL parameters:self.params progress:^(NSProgress * _Nonnull uploadProgress) {
                
                //进度
                
                
            } success:^(NSURLSessionDataTask *task, id responseObject) {
              
                if (self.successBlock) {
                
                    self.successBlock(responseObject);
                    
                    if (showHUD)
                    {
                        [SVProgressHUD dismiss];
                    }
                }
             
                
                [[LXNetworkHandler sharedInstance] removeItem:self];
             
             
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                
               
                
                
                if (self.failureBlock) {
                    self.failureBlock(nil);
                    if (showHUD)
                    {
                        // 判断是否有网
                        
                        //                        if ([XAppDelegate startRealTimeNetworkStatus])
                        //                        {
                        //                            [UnityLHClass showAlertView:@"亲,你的网络好像不给力哟"];
                        //
                        //                        }else{
                        //
                        //                            [UnityLHClass showAlertView:@"对不起,请检查你的网络."];
                        //                        }
                    }
                    
                } else {
                    [LXUnityclass showAlertView:@"亲,你的网络好像不给力哟"];
                }
                
                if (showHUD)
                {
                    [SVProgressHUD dismiss];
                }
                [[LXNetworkHandler sharedInstance] removeItem:self];
                
            }];
        }
        
    }
    return self;
}


/**
 *  表单上传
 *
 *  @param networkType  <#networkType description#>
 *  @param url          <#url description#>
 *  @param params       <#params description#>
 *  @param images       <#images description#>
 *  @param delegate     <#delegate description#>
 *  @param hashValue    <#hashValue description#>
 *  @param showHUD      <#showHUD description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 *
 *  @return <#return value description#>
 */

//- (LXNetworkItem *) initWithtype:(NetWorkType) networkType
//                             url:(NSString *) url
//                          params:(NSDictionary *) params
//                          images:(NSDictionary *) images
//                        delegate:(id) delegate
//                       hashValue:(NSUInteger) hashValue
//                         showHUD:(BOOL) showHUD
//                    successBlock:(NWSuccessBlock) successBlock
//                    failureBlock:(NWFailureBlock) failureBlock
//{
//    if (self = [super init])
//    {
//        self.networkType = networkType;
//        self.url = url;
//        self.params = params;
//        self.delegate = delegate;
//        self.hashValue = hashValue;
//        self.showHUD = showHUD;
//        self.successBlock = successBlock;
//        self.failureBlock = failureBlock;
//
//        [[LXNetworkHandler sharedInstance] addItem:self];
//
//        for (NSData *image in images) {
//            NSLog(@"图片：%@", image);
//
////            __weak LXNetworkItem *weakSelf = self;
//            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//            [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//
//                for (NSString *keyString in [images allKeys])
//                {
//                    NSData *imgData = [images objectForKey:keyString];
//                    if (imgData.length > 0) {
//
//                        [formData appendPartWithFormData:imgData name:keyString];
//                        NSLog(@"图片上传%@",keyString);
//
//                    }
//                }
//
//            } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                NSLog(@"图片上传成功: %@", responseObject);
//                if (self.successBlock) {
//                    self.successBlock(responseObject);
//                }
//                [[LXNetworkHandler sharedInstance] removeItem:self];
//            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                NSLog(@"图片上传失败: %@", error);
//                if (self.failureBlock) {
//                    self.failureBlock(error);
//                } else {
////                    [UIAlertView alertWithTitle:@"提示" message:@"网络异常，请稍后重试" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
//                }
//                [[LXNetworkHandler sharedInstance] removeItem:self];
//            }];
//        }
//    }
//
//    return self;
//}

- (LXNetworkItem *) initDownloadWithtype:(NetWorkType) networkType
                                     url:(NSString *) url
                                delegate:(id) delegate
                               hashValue:(NSUInteger) hashValue
                              startBlock:(NWStartBlock) startBlock
                            successBlock:(NWSuccessBlock) successBlock
                            failureBlock:(NWFailureBlock) failureBlock
{
    if (self = [super init])
    {
        self.networkType = networkType;
        self.url = url;
        self.delegate = delegate;
        self.hashValue = hashValue;
    }
    
    return self;
}


@end
