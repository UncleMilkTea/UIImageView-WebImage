//
//  HYKReadAndWriteSandBox.h
//
//  Created by 侯玉昆 on 16/1/26.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HYKReadAndWriteSandBox : NSObject

+ (instancetype)sharedSandBox;

- (NSString *)getSandBoxWithUrl:(NSString *)urlStr;
//! 写入沙盒数据

- (void)writeSandBox:(NSData *)data andUrlStr:(NSString *)urlStr;
//! 读取沙盒图片

- (UIImage *)readFromSandBoxImage:(NSString *)urlStr;
@end
