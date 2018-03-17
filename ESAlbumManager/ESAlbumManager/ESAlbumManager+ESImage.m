//
//  ESAlbumManager+ESImage.m
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/27.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAlbumManager+ESImage.h"

@implementation ESAlbumManager (ESImage)
#pragma mark - 缩略图
//+ (PHImageRequestID)imageThumbnailForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize isSync:(BOOL)isSync isHightQuality:(BOOL)isHightQuality isCache:(BOOL)isCache resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler {
//    
//    if (CGSizeEqualToSize(targetSize, CGSizeZero) || !asset) {
//        return -1;
//    }
//    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
//    options.synchronous = isSync;
//    options.resizeMode = PHImageRequestOptionsResizeModeExact;
//    targetSize = CGSizeMake(targetSize.width * [UIScreen mainScreen].scale, targetSize.height * [UIScreen mainScreen].scale);
//    return [self imageForAsset:asset targetSize:targetSize isHightQuality:isHightQuality isCache:isCache contentMode:PHImageContentModeAspectFill options:options resultHandler:resultHandler];
//}
//
//#pragma mark - 原图
//+ (PHImageRequestID)imageOriginForAsset:(PHAsset *)asset isSync:(BOOL)isSync isCache:(BOOL)isCache resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler {
//    if (!asset) {
//        return -1;
//    }
//    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
//    options.synchronous = isSync;
//    return [self imageForAsset:asset targetSize:PHImageManagerMaximumSize isHightQuality:YES isCache:isCache contentMode:PHImageContentModeDefault options:options resultHandler:resultHandler];
//}
//
//#pragma mark - 预览图
//+ (PHImageRequestID)imagePreviewForAsset:(PHAsset *)asset isSync:(BOOL)isSync isCache:(BOOL)isCache resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler {
//    if (!asset) {
//        return -1;
//    }
//    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
//    options.synchronous = isSync;
//    options.resizeMode = PHImageRequestOptionsResizeModeNone;
//    return [self imageForAsset:asset targetSize:[UIScreen mainScreen].bounds.size isHightQuality:YES isCache:isCache contentMode:PHImageContentModeAspectFill options:options resultHandler:resultHandler];
//}
//
//+ (PHImageRequestID)imageForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize isHightQuality:(BOOL)isHightQuality isCache:(BOOL)isCache contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler {
//    
//    if (isCache) {
//        //缓存图片
//        [self startCachingAssets:@[asset] targetSize:targetSize contentMode:contentMode options:options];
//    }
//    
//    return [[self assetCachingManager] requestImageForAsset:asset targetSize:targetSize contentMode:contentMode options:options resultHandler:^(UIImage *result, NSDictionary *info) {
//        
//        if ([[info objectForKey:PHImageCancelledKey] boolValue] || [info objectForKey:PHImageErrorKey]) {
//            return;
//        }
//        //异步情况先会先返回一个低清图再返回高清图
//        //同步情况下只会返回一个高清图
//        if (options.isSynchronous) {
//            //同步访问图片
//            if (![[info objectForKey:PHImageResultIsDegradedKey] boolValue]) {
//                if (resultHandler) resultHandler(result,info);
//            }
//        }else {
//            //异步访问图片
//            if ([[info objectForKey:PHImageResultIsDegradedKey] boolValue] && !isHightQuality) {
//                //低清图
//                if (resultHandler) resultHandler(result,info);
//            }else if (![[info objectForKey:PHImageResultIsDegradedKey] boolValue] && isHightQuality) {
//                //高清图
//                if (resultHandler) resultHandler(result,info);
//            }
//        }
//    }];
//}
//
//+ (PHImageRequestID)imageDataForAsset:(PHAsset *)asset options:(PHImageRequestOptions *)options resultHandler:(void(^)(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info))resultHandler {
//    if (!asset) {
//        return -1;
//    }
//    return [[self assetCachingManager] requestImageDataForAsset:asset options:options resultHandler:^(NSData * imageData, NSString * dataUTI, UIImageOrientation orientation, NSDictionary * info) {
//        if (resultHandler) {
//            resultHandler(imageData,dataUTI,orientation,info);
//        }
//    }];
//}
@end
