//
//  UIImageView+WebImage.m
//  自定义下载图片框架
//
//  Created by 侯玉昆 on 16/1/28.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "UIImageView+WebImage.h"
#import "HYKWebImageManager.h"
#import "HYKReadAndWriteSandBox.h"
#import "HYKDownLoadeWebImageOperation.h"

@implementation UIImageView (WebImage)


- (void)setWebImageUrlString:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage {
    
    HYKWebImageManager *manager = [HYKWebImageManager shareManager];
    
    //! 先从缓存中读取图片
    UIImage *image = [manager.imageDic objectForKey:urlString];
    
    if (image) {
        
        self.image = image;
        
        NSLog(@"从内存中读取图片");
        
        return ;
    }
    
    //! 再从沙盒中读取图片
  UIImage *sandBoximage = [[HYKReadAndWriteSandBox sharedSandBox] readFromSandBoxImage:urlString];
    
    if (sandBoximage) {
        
        NSLog(@"从沙盒缓存中读取图片");
        
        self.image = sandBoximage;
        
        // 将沙盒缓存中的图片存到内存缓存中,防止频繁的 I/O 操作
        [manager.imageDic setObject:sandBoximage forKey:urlString];
        
        return;
    }
    
    //! 设置占位图片
    if (placeholderImage) {
        
        self.image = placeholderImage;
    }
    
    //! 开始下载网络图片
    [manager downloadWebImageWithUrlStr:urlString setUpImage:^(UIImage *setUpimage) {
        
        NSLog(@"图片下载完成之后,直接显示图片");
        
        self.image = setUpimage;
        
        /**************************************************************
         *   图片下载完毕之后,直接显示图片 : 图片错位问题!
              如果在图片下载过程红,用户滚动了(cell重用了) --- 将
              原来的图片下载操作取消,开始新的图片下载!
         **************************************************************/
    }];
    
    

}

@end
