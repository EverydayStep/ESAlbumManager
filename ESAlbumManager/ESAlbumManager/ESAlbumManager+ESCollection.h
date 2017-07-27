//
//  ESAlbumManager+ESCollection.h
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/27.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESAlbumManager.h"
@interface ESAlbumManager (ESCollection)
#pragma mark - 用户创建相册
/**
 查询用户创建的标题为title的相册
 
 @param title 相册标题
 @return 用户创建的相册
 */
+ (PHFetchResult<PHCollection *>*)userAssetCollectionsWithTitle:(NSString *)title;

/**
 查询用户创建的相册
 
 @param options 查询条件 无条件传nil
 @return 用户创建的相册
 */
+ (PHFetchResult<PHCollection *>*)userAssetCollectionsWithOptions:(PHFetchOptions *)options;

#pragma mark - 系统相册
/**
 查询相册
 
 @param type 相册组类型
 @param subtype 相册类型
 @param options 查询条件 无条件传nil
 @return 查询结果
 */
+ (PHFetchResult<PHAssetCollection *>*)assetCollectionsWithType:(PHAssetCollectionType)type subtype:(PHAssetCollectionSubtype)subtype options:(PHFetchOptions *)options;

/**
 查询相册

 @param identifiers 相册的ID
 @param options 查询条件 无条件传nil
 @return 查询结果
 */
+ (PHFetchResult<PHAssetCollection *> *)assetCollectionsWithLocalIdentifiers:(NSArray<NSString *> *)identifiers options:(PHFetchOptions *)options;

#pragma mark - 创建相册
/**
 创建相册
 
 @param title 相册标题
 @param success 创建成功
 @param fail 创建失败
 */
+ (void)createAssetCollectionWithTitle:(NSString *)title success:(void(^)(void))success fail:(void(^)(NSError *error))fail;

#pragma mark - 删除相册
/**
 删除相册
 
 @param assetCollections 待删除的相册
 @param success 删除成功
 @param fail 删除失败
 */
+ (void)deleteAssetCollections:(NSArray *)assetCollections success:(void(^)(void))success fail:(void(^)(NSError *error))fail;

@end
