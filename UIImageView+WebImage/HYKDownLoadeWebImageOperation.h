//
//  HYKDownLoadeWebImageOperation.h
//  自定义下载图片框架
//
//  Created by 侯玉昆 on 16/1/28.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HYKDownLoadeWebImageOperation;

//! 自定义block类型
typedef void(^downLoadeBlock)(HYKDownLoadeWebImageOperation *op);

@interface HYKDownLoadeWebImageOperation : NSOperation

//! 网络图片的地址
@property(copy,nonatomic) NSString *urlString;

//! 下载完成的网络图片
@property(strong,nonatomic) UIImage *image;

//! 下载完成之后的回调
@property(copy,nonatomic) downLoadeBlock block;

//! 下载完成之后回调方法
- (void)downLoadWebimageFinish:(downLoadeBlock)blk;

@end
