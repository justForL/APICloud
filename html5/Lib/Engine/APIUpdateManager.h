//
//  APIUpdateManager.h
//  UZEngine
//
//  Created by kenny on 16/3/15.
//  Copyright © 2016年 APICloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APISmartUpdateDelegate;

@interface APIUpdateManager : NSObject

/*! 设置云修复更新代理 */
@property (nonatomic, weak) id<APISmartUpdateDelegate>smartUpdateDelegate;

+ (instancetype)manager;

@end


@interface SmartUpdatePackage : NSObject

@property (nonatomic, readonly) BOOL silent;    // 是否是静默更新包
@property (nonatomic, readonly) int version;    // 更新包版本
@property (nonatomic, copy, readonly) NSString *extra;  //更新包附加信息

@end


@protocol APISmartUpdateDelegate <NSObject>

/*!
 若是提示更新，当更新包下载成功后，会弹出是否重启应用对话框，用户点击立即重启后，SuperWebView会进行云修复生效处理，处理完成以后将通过此方法进行回调。
 @param packages 所有本次更新的云修复包
 */
- (void)didSmartUpdateFinished:(NSArray *)packages;

@end
