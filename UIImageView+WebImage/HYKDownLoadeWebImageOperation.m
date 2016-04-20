//
//  HYKDownLoadeWebImageOperation.m
//  图片下载操作类
//
//  Created by 侯玉昆 on 16/1/28.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKDownLoadeWebImageOperation.h"
#import "HYKReadAndWriteSandBox.h"

@implementation HYKDownLoadeWebImageOperation

- (void)main {

    @autoreleasepool {
        
        _image = [self downloadWebImageWithUrlStr:_urlString];
        
    //! 图片下载完成之后的回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (_block) {
            
            _block(self);
          }
      });
   }
}

//! block的回调实现
- (void)downLoadWebimageFinish:(downLoadeBlock)blk {

    if (blk) {
        
        _block = blk;
    }
}


//! 下载网络图片
- (UIImage *)downloadWebImageWithUrlStr:(NSString *)urlString{

    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    
     UIImage *image = [UIImage imageWithData:data];
    
    if (data) {
        //! 存入沙盒
        [[HYKReadAndWriteSandBox sharedSandBox] writeSandBox:data andUrlStr:urlString];
    }
    NSLog(@"从网络下载图片成功%@",[NSThread currentThread]);
    
    return image;
}


@end
