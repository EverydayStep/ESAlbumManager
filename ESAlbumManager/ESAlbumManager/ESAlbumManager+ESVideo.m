//
//  ESAlbumManager+ESVideo.m
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/27.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAlbumManager+ESVideo.h"
//#import "ESAlbumManager+ESImage.h"

@implementation ESAlbumManager (ESVideo)
#pragma mark - Image
//+ (PHImageRequestID)videoThumbnailForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize isSync:(BOOL)isSync isHightQuality:(BOOL)isHightQuality isCache:(BOOL)isCache resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler {
//    return [self imageThumbnailForAsset:asset targetSize:targetSize isSync:isSync isHightQuality:isHightQuality isCache:isCache resultHandler:resultHandler];
//}
//
//
//+ (PHImageRequestID)videoPreviewForAsset:(PHAsset *)asset isSync:(BOOL)isSync isCache:(BOOL)isCache resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler {
//    return [self imagePreviewForAsset:asset isSync:isSync isCache:isCache resultHandler:resultHandler];
//}
//
//#pragma mark - 获取视频
//+ (PHImageRequestID)videoPlayerItemForAsset:(PHAsset *)asset options:(PHVideoRequestOptions *)options resultHandler:(void (^)(AVPlayerItem *playerItem, NSDictionary *info))resultHandler {
//    if (!asset) {
//        return -1;
//    }
//    return [[self assetCachingManager] requestPlayerItemForVideo:asset options:options resultHandler:^(AVPlayerItem *playerItem, NSDictionary *info) {
//        if (resultHandler) {
//            resultHandler(playerItem,info);
//        }
//    }];
//}
//
//+ (PHImageRequestID)videoExportSessionForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options exportPreset:(NSString *)exportPreset resultHandler:(void (^)(AVAssetExportSession *exportSession, NSDictionary *info))resultHandler {
//    if (!asset) {
//        return -1;
//    }
//    return [[self assetCachingManager] requestExportSessionForVideo:asset options:options exportPreset:AVAssetExportPreset1280x720 resultHandler:^(AVAssetExportSession * exportSession, NSDictionary * info) {
//        if (resultHandler) {
//            resultHandler(exportSession, info);
//        }
//    }];
//}
//
//+ (PHImageRequestID)videoAVAssetForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options resultHandler:(void (^)(AVAsset *asset, AVAudioMix *audioMix, NSDictionary *info))resultHandler {
//    if (!asset) {
//        return -1;
//    }
//    return [[self assetCachingManager] requestAVAssetForVideo:asset options:options resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
//        if (resultHandler) {
//            resultHandler(asset,audioMix,info);
//        }
//    }];
//}
@end
