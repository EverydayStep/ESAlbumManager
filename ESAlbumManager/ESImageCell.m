//
//  ESImageCell.m
//  ESAlbumManager
//
//  Created by codeLocker on 2017/7/27.
//  Copyright © 2017年 codeLocker. All rights reserved.
//

#import "ESImageCell.h"

@interface ESImageCell()

@end

@implementation ESImageCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

@end
