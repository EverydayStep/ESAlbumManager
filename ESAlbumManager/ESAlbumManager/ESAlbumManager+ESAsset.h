//
//  ESAlbumManager+ESAsset.h
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/27.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAlbumManager.h"

@interface ESAlbumManager (ESAsset)
#pragma mmark - Query Asset
/**
 查询照片库中资源
 
 @param options 查询条件 无条件传nil
 @return 查询结果
 */
+ (PHFetchResult<PHAsset *> *)assetsWithOptions:(PHFetchOptions *)options;
/**
 查询照片库中资源
 
 @param mediaType 查询的类型
 @param options 查询条件 无条件传nil
 @return 查询结果
 */
+ (PHFetchResult<PHAsset *> *)assetsWithMediaType:(PHAssetMediaType)mediaType options:(PHFetchOptions *)options;
/**
 查询相册中的资源
 
 @param assetCollection 相册
 @param options 查询条件 无条件传nil
 @return 查询结果
 */
+ (PHFetchResult<PHAsset *> *)assetsInAssetCollection:(PHAssetCollection *)assetCollection options:(PHFetchOptions *)options;
/**
 查询照片库资源
 
 @param identifiers 查询的id
 @param options 查询条件 无条件传nil
 @return 查询结果
 */
+ (PHFetchResult<PHAsset *> *)assetsWithLocalIdentifiers:(NSArray<NSString *> *)identifiers options:(PHFetchOptions *)options;
/**
 查询相册关键资源
 
 @param assetCollection 相册
 @param options 查询条件 无条件传nil
 @return 查询结果
 */
+ (PHFetchResult<PHAsset *> *)keyAssetsInAssetCollection:(PHAssetCollection *)assetCollection options:(PHFetchOptions *)options;

/**
 查询照片库资源
 
 @param burstIdentifier burstIdentifier 查询burstID
 @param options 查询条件 无条件传nil
 @return 查询结果
 */
+ (PHFetchResult<PHAsset *> *)assetsWithBurstIdentifier:(NSString *)burstIdentifier options:(PHFetchOptions *)options;

/**
 查询照片库资源
 
 @param assetURLs 资源的URL
 @param options 查询条件 无条件传nil
 @return 查询结果
 */
+ (PHFetchResult<PHAsset *> *)assetsWithALAssetURLs:(NSArray<NSURL *> *)assetURLs options:(PHFetchOptions *)options;

#pragma mark - 保存照片
/**
 保存图片

 @param image UIImage
 @param collection 目标相册
 @param success 成功回调
 @param fail 失败回调
 */
+ (void)saveImage:(UIImage *)image toCollection:(PHAssetCollection *)collection success:(void(^)(void))success fail:(void(^)(NSError *error))fail;
/**
 保存图片
 
 @param fileURL UIImage
 @param collection 目标相册
 @param success 成功回调
 @param fail 失败回调
 */
+ (void)saveImageAtFileURL:(NSURL *)fileURL toCollection:(PHAssetCollection *)collection success:(void(^)(void))success fail:(void(^)(NSError *error))fail;

#pragma mark - 保存 Video
/**
 保存视频

 @param fileURL 视频路径
 @param collection 目标相册
 @param success 成功回调
 @param fail 失败回调
 */
+ (void)saveVideoAtFileURL:(NSURL *)fileURL toCollection:(PHAssetCollection *)collection success:(void(^)(void))success fail:(void(^)(NSError *error))fail;

#pragma mark - 保存 Asset
/**
 保存Asset

 @param fileURL 资源路径
 @param type 资源类型
 @param collection 目标相册
 @param options 条件
 @param success 成功回调
 @param fail 失败回调
 */
+ (void)saveAssetAtFileURL:(NSURL *)fileURL type:(PHAssetResourceType)type toCollection:(PHAssetCollection *)collection options:(PHAssetResourceCreationOptions *)options success:(void(^)(void))success fail:(void(^)(NSError *error))fail;

/**
 保存Asset

 @param data 资源data
 @param type 资源类型
 @param collection 目标相册
 @param options 条件
 @param success 成功回调
 @param fail 失败回调
 */
+ (void)saveAssetWithData:(NSData *)data type:(PHAssetResourceType)type toCollection:(PHAssetCollection *)collection options:(PHAssetResourceCreationOptions *)options success:(void(^)(void))success fail:(void(^)(NSError *error))fail;

#pragma mark - 删除 Asset
/**
 删除PHAsset

 @param asset PHAsset
 @param success 成功回调
 @param fail 失败回到
 */
+ (void)deleteAsset:(PHAsset *)asset success:(void(^)(void))success fail:(void(^)(NSError *error))fail;
@end
