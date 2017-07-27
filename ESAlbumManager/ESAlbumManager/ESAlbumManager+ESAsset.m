//
//  ESAlbumManager+ESAsset.m
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/27.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAlbumManager+ESAsset.h"

@implementation ESAlbumManager (ESAsset)
#pragma mmark - Query Asset
+ (PHFetchResult<PHAsset *> *)assetsWithOptions:(PHFetchOptions *)options {
    PHFetchResult *result = [PHAsset fetchAssetsWithOptions:options];
    return result;
}

+ (PHFetchResult<PHAsset *> *)assetsWithMediaType:(PHAssetMediaType)mediaType options:(PHFetchOptions *)options {
    return [PHAsset fetchAssetsWithMediaType:mediaType options:options];
}

+ (PHFetchResult<PHAsset *> *)assetsInAssetCollection:(PHAssetCollection *)assetCollection options:(PHFetchOptions *)options {
    return [PHAsset fetchAssetsInAssetCollection:assetCollection options:options];
}

+ (PHFetchResult<PHAsset *> *)assetsWithLocalIdentifiers:(NSArray<NSString *> *)identifiers options:(PHFetchOptions *)options {
    return [PHAsset fetchAssetsWithLocalIdentifiers:identifiers options:options];
}

+ (PHFetchResult<PHAsset *> *)keyAssetsInAssetCollection:(PHAssetCollection *)assetCollection options:(PHFetchOptions *)options {
    return [PHAsset fetchKeyAssetsInAssetCollection:assetCollection options:options];
}

+ (PHFetchResult<PHAsset *> *)assetsWithBurstIdentifier:(NSString *)burstIdentifier options:(PHFetchOptions *)options {
    return [PHAsset fetchAssetsWithBurstIdentifier:burstIdentifier options:options];
}

+ (PHFetchResult<PHAsset *> *)assetsWithALAssetURLs:(NSArray<NSURL *> *)assetURLs options:(PHFetchOptions *)options {
    return [PHAsset fetchAssetsWithALAssetURLs:assetURLs options:options];
}

#pragma mark - Save Asset
+ (void)saveImage:(UIImage *)image toCollection:(PHAssetCollection *)collection success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!image || !collection) {
        return;
    }
    
    dispatch_block_t change = ^{
        PHAssetCreationRequest *assetRequest = [PHAssetCreationRequest creationRequestForAssetFromImage:image];
        PHAssetCollectionChangeRequest *collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        [collectionRequest addAssets:@[assetRequest.placeholderForCreatedAsset]];
    };
    [self saveAsset:change success:success fail:fail];
}

+ (void)saveImageAtFileURL:(NSURL *)fileURL toCollection:(PHAssetCollection *)collection success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!fileURL || !collection) {
        return;
    }
    dispatch_block_t change = ^{
        PHAssetCreationRequest *assetRequest = [PHAssetCreationRequest creationRequestForAssetFromImageAtFileURL:fileURL];
        PHAssetCollectionChangeRequest *collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        [collectionRequest addAssets:@[assetRequest.placeholderForCreatedAsset]];
    };
    [self saveAsset:change success:success fail:fail];
}

+ (void)saveImageWithData:(NSData *)data resourceType:(PHAssetResourceType)resourceType toCollection:(PHAssetCollection *)collection options:(PHAssetResourceCreationOptions *)options success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!data) {
        return;
    }
    dispatch_block_t change = ^{
        PHAssetCreationRequest *assetRequest = [PHAssetCreationRequest creationRequestForAsset];
        [assetRequest addResourceWithType:resourceType data:data options:options];
        PHAssetCollectionChangeRequest *collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        [collectionRequest addAssets:@[assetRequest.placeholderForCreatedAsset]];
    };
    [self saveAsset:change success:success fail:fail];
}


+ (void)saveAsset:(dispatch_block_t)change success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!change) {
        return;
    }
    PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
    [photoLibrary performChanges:change completionHandler:^(BOOL isSuccess, NSError * _Nullable error) {
        if (isSuccess) {
            es_block_safe(success);
        }else {
            if (fail) {
                fail(error);
            }
        }
    }];
}

@end
