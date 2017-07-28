//
//  ESAlbumManager+ESVideo.h
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/27.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAlbumManager.h"

@interface ESAlbumManager (ESVideo)
#pragma mark - Image
/**
 获取视屏的缩略图
 
 @param asset 资源文件
 @param targetSize 缩略图的尺寸
 @param isSync 是否线程同步执行
 @param isHightQuality 是否获取高质量图片，isSync=YES 情况下只有高质量图片
 @param isCache 是否需要缓存(缓存大量图片会造成大量内存占用)
 @param resultHandler 回调处理
 @return requestID
 */
+ (PHImageRequestID)videoThumbnailForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize isSync:(BOOL)isSync isHightQuality:(BOOL)isHightQuality isCache:(BOOL)isCache resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler;

/**
 获取视屏的预览图
 
 @param asset 资源文件
 @param isSync 是否线程同步执行
 @param isCache 是否需要缓存(缓存大量图片会造成大量内存占用)
 @param resultHandler 回调处理
 @return requestID
 */
+ (PHImageRequestID)videoPreviewForAsset:(PHAsset *)asset isSync:(BOOL)isSync isCache:(BOOL)isCache resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler;

/**
 获取playerItem 视频

 @param asset 资源文件
 @param options 条件
 @param resultHandler 回调处理
 @return requestID
 */
+ (PHImageRequestID)videoPlayerItemForAsset:(PHAsset *)asset options:(PHVideoRequestOptions *)options resultHandler:(void (^)(AVPlayerItem *playerItem, NSDictionary *info))resultHandler;

/**
 导出视频

 @param asset 资源文件
 @param options 条件
 @param exportPreset 导出格式 AVAssetExportPresetLowQuality AVAssetExportPresetMediumQuality AVAssetExportPresetHighestQuality AVAssetExportPreset640x480 AVAssetExportPreset1280x720
 @param resultHandler 回调处理
 @return requestID
 */
+ (PHImageRequestID)videoExportSessionForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options exportPreset:(NSString *)exportPreset resultHandler:(void (^)(AVAssetExportSession *exportSession, NSDictionary *info))resultHandler;

/**
 导出AVAsset

 @param asset AVAsset
 @param options 条件
 @param resultHandler 回调处理
 @return requestID
 */
+ (PHImageRequestID)videoAVAssetForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options resultHandler:(void (^)(AVAsset *asset, AVAudioMix *audioMix, NSDictionary *info))resultHandler;
@end
