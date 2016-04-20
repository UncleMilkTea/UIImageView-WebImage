//
//  UIImageView+UIImageView_WebImage.h
//  自定义下载图片框架
//
//  Created by 侯玉昆 on 16/1/28.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYKReadAndWriteSandBox.h"

@interface UIImageView (WebImage)

/**
 *  一行代码轻松搞定网络图片下载
 *
 *  @param urlString        网络图片下载地址
 *  @param placeholderImage 占位图片
 */
- (void)setWebImageUrlString:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage;

@end
