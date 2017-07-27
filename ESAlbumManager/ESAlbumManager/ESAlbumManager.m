//
//  ESAlbumManager.m
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/26.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAlbumManager.h"
@implementation ESAlbumManager

+ (void)authorizationAccept:(void(^)(void))accept decline:(void(^)(void))decline {
    //相册权限判断
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied) {
        es_block_safe(decline);//拒绝
    }else if (status == PHAuthorizationStatusNotDetermined){
        //相册进行授权
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            //授权回调
            if (status == PHAuthorizationStatusAuthorized) {
                es_block_safe(accept);//授权
            }
            else{
                es_block_safe(decline);//拒绝
            }
        }];
    }else if (status == PHAuthorizationStatusAuthorized){
        es_block_safe(accept);//相册已授权
    }
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
