//
//  ESAlbumManager+ESCollection.m
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/27.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAlbumManager+ESCollection.h"
#import <ESUtils/ESUtils.h>

@implementation ESAlbumManager (ESCollection)
#pragma mark - Asset Collections
#pragma mark - Query User
+ (PHFetchResult<PHCollection *>*)userAssetCollectionsWithTitle:(NSString *)title {
    if ([ESUtils isEmptyString:title]) {
        return nil;
    }
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"localizedTitle == '%@'",title]];
    options.predicate = predicate;
    return [self userAssetCollectionsWithOptions:options];
}

+ (PHFetchResult<PHCollection *>*)userAssetCollectionsWithOptions:(PHFetchOptions *)options {
    return [PHCollectionList fetchTopLevelUserCollectionsWithOptions:options];
}

#pragma mark - Query System
+ (PHFetchResult<PHAssetCollection *>*)assetCollectionsWithType:(PHAssetCollectionType)type subtype:(PHAssetCollectionSubtype)subtype options:(PHFetchOptions *)options {
    return [PHAssetCollection fetchAssetCollectionsWithType:type subtype:subtype options:options];
}

+ (PHFetchResult<PHAssetCollection *> *)assetCollectionsWithLocalIdentifiers:(NSArray<NSString *> *)identifiers options:(PHFetchOptions *)options {
    return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:identifiers options:options];
}

#pragma mark - Create Collection
//+ (void)createAssetCollectionWithTitle:(NSString *)title success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
//    if ([ESUtils isEmptyString:title]) {
//        NSError *error = [NSError errorWithDomain:@"相册title不能为空" code:-1 userInfo:nil];
//        fail(error);
//        return;
//    }
//    PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
//    [photoLibrary performChanges:^{
//        [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title];
//    } completionHandler:^(BOOL isSuccess, NSError * _Nullable error) {
//        if (isSuccess) {
//            if (success) {
//                success();
//            }
//        }else {
//            if (fail) {
//                fail(error);
//            }
//        }
//    }];
//}
//
//#pragma mark - Delete Collection
//+ (void)deleteAssetCollections:(NSArray *)assetCollections success:(void(^)(void))success fail:(void(^)(NSError *error))fail {
//    if ([ESUtils isEmptyArray:assetCollections]) {
//        return;
//    }
//    PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
//    [photoLibrary performChanges:^{
//        [PHAssetCollectionChangeRequest deleteAssetCollections:assetCollections];
//    } completionHandler:^(BOOL isSuccess, NSError * _Nullable error) {
//        if (isSuccess) {
//            if (success) {
//                success();
//            }
//        }else {
//            if (fail) {
//                fail(error);
//            }
//        }
//    }];
//}

@end
