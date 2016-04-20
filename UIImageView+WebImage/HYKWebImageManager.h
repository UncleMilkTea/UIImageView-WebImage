//
//  HYKWebImageManager.h
//  图片下载管理类
//
//  Created by 侯玉昆 on 16/1/28.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//! 图片下载完成之后回调block将图片返回
typedef void(^setUpImageBlock)(UIImage *image);

@interface HYKWebImageManager : NSObject

//! 图片缓存
@property(strong,nonatomic) NSMutableDictionary *imageDic;

//! 操作缓存
@property(strong,nonatomic) NSMutableDictionary *operionDic;

//! 管理类的单例对象
+ (instancetype)shareManager;

//! 回调block函数将图片返回
- (void)downloadWebImageWithUrlStr:(NSString *)urlStr setUpImage:(setUpImageBlock)setUpimage;



@end
