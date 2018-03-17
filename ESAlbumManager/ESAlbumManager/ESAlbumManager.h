//
//  ESAlbumManager.h
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/26.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface ESAlbumManager : NSObject

/**
 相册当前访问权限
 
 @return 访问权限
 */
+ (PHAuthorizationStatus)authorizationState;

/**
 相册授权
 
 @param accept 授权
 @param decline 拒绝
 */
+ (void)authorization:(void(^)(void))accept decline:(void(^)(void))decline;

/**
 取消资源请求

 @param requestID 请求ID
 */
//+ (void)cancelImageRequest:(PHImageRequestID)requestID;

/**
 开始缓存

 @param assets 资源文件
 @param targetSize 目标尺寸
 @param contentMode 内容模式
 @param options 条件
 */
//+ (void)startCachingAssets:(NSArray<PHAsset *> *)assets targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options;

/**
 停止缓存
 
 @param assets 资源文件
 @param targetSize 目标尺寸
 @param contentMode 内容模式
 @param options 条件
 */
//+ (void)stopCachingAssets:(NSArray<PHAsset *> *)assets targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options;

/**
 停止所有缓存
 */
//+ (void)stopCachingAllAssets;

/**
 请求管理器

 @return 管理器
 */
//+ (PHCachingImageManager *)assetCachingManager;
@end
