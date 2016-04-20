# UIImageView-WebImage
一句话下载网络图片

##TODO

###一行代码轻松搞定网络图片下载

导入头文件 UIImageView+WebImage

作为UIImageView的分类直接用imageView属性调用下面方法即可

/*  @param urlString        网络图片下载地址
*   @param placeholderImage 占位图片
*/
- (void)setWebImageUrlString:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage;

###沙盒读取工具

单例调用
+ (instancetype)sharedSandBox;

//! 获取沙盒路径

- (NSString *)getSandBoxWithUrl:(NSString *)urlStr;

//! 写入沙盒数据

- (void)writeSandBox:(NSData *)data andUrlStr:(NSString *)urlStr;

//! 读取沙盒图片

- (UIImage *)readFromSandBoxImage:(NSString *)urlStr;



## Author

Weibo:[@老实人要刨你家祖坟了](http://weibo.com/caoeggs) 

Github:[houyukun](https://github.com/houyukun) 
