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

#pragma mark - Save Image
+ (void)saveImage:(UIImage *)image toCollection:(PHAssetCollection *)collection success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!image || !collection) {
        if (fail) fail(nil);
        return;
    }
    
    dispatch_block_t change = ^{
        PHAssetCreationRequest *assetRequest = [PHAssetCreationRequest creationRequestForAssetFromImage:image];
        PHAssetCollectionChangeRequest *collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        [collectionRequest addAssets:@[assetRequest.placeholderForCreatedAsset]];
    };
    [self perform:change success:success fail:fail];
}

+ (void)saveImageAtFileURL:(NSURL *)fileURL toCollection:(PHAssetCollection *)collection success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!fileURL || !collection) {
        if (fail) fail(nil);
        return;
    }
    dispatch_block_t change = ^{
        PHAssetCreationRequest *assetRequest = [PHAssetCreationRequest creationRequestForAssetFromImageAtFileURL:fileURL];
        PHAssetCollectionChangeRequest *collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        [collectionRequest addAssets:@[assetRequest.placeholderForCreatedAsset]];
    };
    [self perform:change success:success fail:fail];
}

#pragma mark - Save Video
+ (void)saveVideoAtFileURL:(NSURL *)fileURL toCollection:(PHAssetCollection *)collection success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!fileURL || !collection) {
        if (fail) fail(nil);
        return;
    }
    dispatch_block_t change = ^{
        PHAssetCreationRequest *assetRequest = [PHAssetCreationRequest creationRequestForAssetFromVideoAtFileURL:fileURL];
        PHAssetCollectionChangeRequest *collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        [collectionRequest addAssets:@[assetRequest.placeholderForCreatedAsset]];
    };
    [self perform:change success:success fail:fail];
}

#pragma mark - Save Asset
+ (void)saveAssetAtFileURL:(NSURL *)fileURL type:(PHAssetResourceType)type toCollection:(PHAssetCollection *)collection options:(PHAssetResourceCreationOptions *)options success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!fileURL || ![PHAssetCreationRequest supportsAssetResourceTypes:@[@(type)]]) {
        if (fail) fail(nil);
        return;
    }
    dispatch_block_t change = ^{
        PHAssetCreationRequest *assetRequest = [PHAssetCreationRequest creationRequestForAsset];
        [assetRequest addResourceWithType:type fileURL:fileURL options:options];
        PHAssetCollectionChangeRequest *collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        [collectionRequest addAssets:@[assetRequest.placeholderForCreatedAsset]];
    };
    [self perform:change success:success fail:fail];
}

+ (void)saveAssetWithData:(NSData *)data type:(PHAssetResourceType)type toCollection:(PHAssetCollection *)collection options:(PHAssetResourceCreationOptions *)options success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!data || ![PHAssetCreationRequest supportsAssetResourceTypes:@[@(type)]]) {
        if (fail) fail(nil);
        return;
    }
    dispatch_block_t change = ^{
        PHAssetCreationRequest *assetRequest = [PHAssetCreationRequest creationRequestForAsset];
        [assetRequest addResourceWithType:type data:data options:options];
        PHAssetCollectionChangeRequest *collectionRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
        [collectionRequest addAssets:@[assetRequest.placeholderForCreatedAsset]];
    };
    [self perform:change success:success fail:fail];
}

#pragma mark - Delete Asset
+ (void)deleteAsset:(PHAsset *)asset success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!asset) {
        if (fail) fail(nil);
        return;
    }
    dispatch_block_t change = ^{
        [PHAssetChangeRequest deleteAssets:@[asset]];
    };
    [self perform:change success:success fail:fail];
}

+ (void)perform:(dispatch_block_t)change success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
    if (!change) {
        if (fail) fail(nil);
        return;
    }
    PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
    [photoLibrary performChanges:change completionHandler:^(BOOL isSuccess, NSError * _Nullable error) {
        if (isSuccess) {
            if (success) {
                success();
            }
        }else {
            if (fail) {
                fail(error);
            }
        }
    }];
}

@end
