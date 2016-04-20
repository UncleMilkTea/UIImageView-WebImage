//
//  HYKReadAndWriteSandBox.m
//
//  Created by 侯玉昆 on 16/1/26.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKReadAndWriteSandBox.h"


@implementation HYKReadAndWriteSandBox


//! 创建沙盒的单例方法
+ (instancetype)sharedSandBox {

    static id _instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance  =[[self alloc]init];
    });

 return _instance;
}


//! 获取沙盒路径
- (NSString *)getSandBoxWithUrl:(NSString *)urlStr {

    NSString *cache = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES).lastObject;
    
    NSString *filePath = cache;
    
    if (urlStr) {
        
       filePath = [cache stringByAppendingString:urlStr.lastPathComponent];
        
            }
   
    return filePath;
}

//! 写入沙盒数据

- (void)writeSandBox:(NSData *)data andUrlStr:(NSString *)urlStr {


    NSString *path = [self getSandBoxWithUrl:urlStr];
    
    [data writeToFile:path atomically:YES];

}

//! 读取沙盒图片

- (UIImage *)readFromSandBoxImage:(NSString *)urlStr {

    NSString *filePath = [self getSandBoxWithUrl:urlStr];
    
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];


    return image;
}
@end
