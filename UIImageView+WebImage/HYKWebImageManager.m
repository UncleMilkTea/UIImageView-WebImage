
//
//  HYKWebImageManager.m
//  自定义下载图片框架
//
//  Created by 侯玉昆 on 16/1/28.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKWebImageManager.h"
#import "HYKDownLoadeWebImageOperation.h"

@interface HYKWebImageManager ()

@property (nonatomic,strong)NSOperationQueue *queue;

@end

@implementation HYKWebImageManager



- (void)downloadWebImageWithUrlStr:(NSString *)urlStr setUpImage:(setUpImageBlock)setUpimage {
    
//    //! 判断操作是否存在
    HYKDownLoadeWebImageOperation *op = [self.operionDic objectForKey:urlStr];
    
    if (op) {
        
        return;
    }

    HYKDownLoadeWebImageOperation *downloadOp = [[HYKDownLoadeWebImageOperation alloc]init];
    
    downloadOp.urlString = urlStr;
    
    [downloadOp downLoadWebimageFinish:^(HYKDownLoadeWebImageOperation *op) {
        if (op.image) {
            
            //! 将下载的图片存入内存
            [self.imageDic setValue:op.image forKey:urlStr];
            
            if (setUpimage) {
                
                setUpimage(op.image);
            }
        }
        //! 移除操作缓存
        [self.operionDic removeObjectForKey:urlStr];
    }];

    //! 将操作存入缓存
    [self.queue addOperation:downloadOp];

}

#pragma mark - 懒加载属性
+ (instancetype)shareManager {

    static id _instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc]init];
    });
    
    return _instance;
}


- (NSOperationQueue *)queue {


    if (!_queue) {
        
        _queue = [[NSOperationQueue alloc]init];
    }
    return _queue;
}

- (NSMutableDictionary *)imageDic {

    if (!_imageDic) {
        
        _imageDic = [NSMutableDictionary dictionary];
    }

    return _imageDic;
}

- (NSMutableDictionary *)operionDic {

    if (!_operionDic) {
        
        _operionDic = [NSMutableDictionary dictionary];
    }
    return _operionDic;
}
@end
