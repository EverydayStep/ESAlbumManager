//
//  ViewController.m
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/26.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ViewController.h"
//#import "ESAlbumManagerHeader.h"
#import "ESImageCell.h"
#import "ESAlbumManager.h"
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource> {
    PHFetchResult *_assets;
    CGSize _targetSize;
}
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = self.view.bounds.size.width / 4.0f;
    _targetSize = CGSizeMake(width, width);
    _targetSize = self.view.bounds.size;
    [self.view addSubview:self.collectionView];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"video" ofType:@"mp4"];
//    NSString *imgPath = [[NSBundle mainBundle] pathForResource:@"test2" ofType:@"png"];
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    PHFetchResult *collections = [ESAlbumManager userAssetCollectionsWithTitle:@"QQ"];
//    [ESAlbumManager saveAssetWithData:data type:PHAssetResourceTypeVideo toCollection:collections.firstObject options:nil success:^{
//        NSLog(@"success");
//    } fail:^(NSError *error) {
//        NSLog(@"%@",error);
//        NSLog(@"fail");
//    }];
//    [ESAlbumManager saveAssetAtFileURL:[NSURL URLWithString:path] type:PHAssetResourceTypeVideo toCollection:collections.firstObject options:nil success:^{
//        NSLog(@"cueess");
//    } fail:^(NSError *error) {
//        NSLog(@"fail");
//    }];
//    
//    [ESAlbumManager saveVideoAtFileURL:[NSURL URLWithString:path] toCollection:collections.firstObject success:^{
//        NSLog(@"success");
//    } fail:^(NSError *error) {
//        NSLog(@"fail");
//    }];
    
//    PHFetchResult *assets = [ESAlbumManager assetsInAssetCollection:collections.firstObject options:nil];
//    [ESAlbumManager deleteAsset:assets.lastObject success:^{
//        NSLog(@"success");
//    } fail:^(NSError *error) {
//        NSLog(@"fail");
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _assets.count;
//    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ESImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ESImageCell class]) forIndexPath:indexPath];
    
//    PHAsset *asset = _assets[indexPath.row];
    
//    [ESAlbumManager imageDataForAsset:asset options:nil resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
//        UIImage *image = [UIImage imageWithData:imageData];
//        cell.imageView.image = image;
//    }];
    
//    [ESAlbumManager imagePreviewForAsset:asset isSync:NO isCache:NO resultHandler:^(UIImage *result, NSDictionary *info) {
//                    es_dispatch_main_async_safe(^{
//                        cell.imageView.image = result;
//                    })
//    }];
//    [ESAlbumManager imageOriginForAsset:asset isSync:NO isCache:NO resultHandler:^(UIImage *result, NSDictionary *info) {
//            es_dispatch_main_async_safe(^{
//                cell.imageView.image = result;
//            })
//    }];
//    [ESAlbumManager imageThumbnailForAsset:asset targetSize:_targetSize isSync:NO isHightQuality:YES isCache:NO resultHandler:^(UIImage *result, NSDictionary *info) {
//            es_dispatch_main_async_safe(^{
//                cell.imageView.image = result;
//            })
//    }];
    
//    [ESAlbumManager videoThumbnailForAsset:asset targetSize:_targetSize isSync:NO isHightQuality:YES isCache:NO resultHandler:^(UIImage *result, NSDictionary *info) {
//        es_dispatch_main_async_safe(^{
//            cell.imageView.image = result;
//        })
//    }];
//    [ESAlbumManager videoPreviewForAsset:asset isSync:NO isCache:NO resultHandler:^(UIImage *result, NSDictionary *info) {
//                es_dispatch_main_async_safe(^{
//                    cell.imageView.image = result;
//                })
//    }];
    
    
//    [ESAlbumManager videoPlayerItemForAsset:asset options:nil resultHandler:^(AVPlayerItem *playerItem, NSDictionary *info) {
//        NSLog(@"%@",playerItem.asset.creationDate);
//    }];
//    [ESAlbumManager videoExportSessionForVideo:asset options:nil exportPreset:@"" resultHandler:^(AVAssetExportSession *exportSession, NSDictionary *info) {
//        
//    }];
    
    return cell;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = _targetSize;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ESImageCell class] forCellWithReuseIdentifier:NSStringFromClass([ESImageCell class])];
        _collectionView.backgroundColor = [UIColor greenColor];
    }
    return _collectionView;
}
@end
