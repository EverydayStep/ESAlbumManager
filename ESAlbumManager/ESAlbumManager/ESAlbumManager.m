//
//  ESAlbumManager.m
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/26.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAlbumManager.h"
@implementation ESAlbumManager

+ (PHAuthorizationStatus)authorizationState {
    return [PHPhotoLibrary authorizationStatus];
}

+ (void)authorization:(void(^)(void))accept decline:(void(^)(void))decline {
    //相册进行授权
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        //授权回调
        if (status == PHAuthorizationStatusAuthorized) {
            if (accept) {
                //授权
                accept();
            }
        }
        else{
            if (decline) {
                //拒绝
                decline();
            }
        }
    }];
}

+ (void)cancelImageRequest:(PHImageRequestID)requestID {
    PHCachingImageManager *manager = (PHCachingImageManager *)[PHCachingImageManager defaultManager];
    [manager cancelImageRequest:requestID];
}

+ (void)startCachingAssets:(NSArray<PHAsset *> *)assets targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options {
    [[self assetCachingManager] startCachingImagesForAssets:assets targetSize:targetSize contentMode:contentMode options:options];
}

+ (void)stopCachingAssets:(NSArray<PHAsset *> *)assets targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options {
    [[self assetCachingManager] stopCachingImagesForAssets:assets targetSize:targetSize contentMode:contentMode options:options];
}

+ (void)stopCachingAllAssets {
    [[self assetCachingManager] stopCachingImagesForAllAssets];
}

+ (PHCachingImageManager *)assetCachingManager {
    return (PHCachingImageManager *)[PHCachingImageManager defaultManager];
}
@end
