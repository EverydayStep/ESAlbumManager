//
//  ESAlbumManager+ESImage.h
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/27.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAlbumManager.h"

@interface ESAlbumManager (ESImage)
#pragma mark - 缩略图

/**
 获取图片做略图

 @param asset 资源文件
 @param targetSize 缩略图的尺寸
 @param isSync 是否线程同步执行
 @param isHightQuality 是否获取高质量图片，isSync=YES 情况下只有高质量图片
 @param isCache 是否需要缓存(缓存大量图片会造成大量内存占用)
 @param resultHandler 回调处理
 @return requestID
 */
//+ (PHImageRequestID)imageThumbnailForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize isSync:(BOOL)isSync isHightQuality:(BOOL)isHightQuality isCache:(BOOL)isCache resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler;

/**
 获取图片原图

 @param asset 资源文件
 @param isSync 是否线程同步执行
 @param isCache 是否需要缓存(缓存大量图片会造成大量内存占用)
 @param resultHandler 回调处理
 @return requestID
 */
//+ (PHImageRequestID)imageOriginForAsset:(PHAsset *)asset isSync:(BOOL)isSync isCache:(BOOL)isCache resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler;

/**
 获取预览图

 @param asset 资源文件
 @param isSync 是否线程同步执行
 @param isCache 是否需要缓存(缓存大量图片会造成大量内存占用)
 @param resultHandler 回调处理
 @return requestID
 */
//+ (PHImageRequestID)imagePreviewForAsset:(PHAsset *)asset isSync:(BOOL)isSync isCache:(BOOL)isCache resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler;

/**
 获取图片

 @param asset 资源文件
 @param targetSize 目标尺寸
 @param isHightQuality 是否获取高质量图片，isSync=YES 情况下只有高质量图片
 @param isCache 是否需要缓存(缓存大量图片会造成大量内存占用)
 @param contentMode 图片模式
 @param options 条件
 @param resultHandler 回调处理
 @return requestID
 */
//+ (PHImageRequestID)imageForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize isHightQuality:(BOOL)isHightQuality isCache:(BOOL)isCache contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler;


/**
 获取图片Data

 @param asset 资源文件
 @param options 条件
 @param resultHandler 回调处理
 @return requestID
 */
//+ (PHImageRequestID)imageDataForAsset:(PHAsset *)asset options:(PHImageRequestOptions *)options resultHandler:(void(^)(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info))resultHandler;
@end
