//
//  ScreenUtil.m
//  ScreenDaemon
//
//  Created by SuperChao on 2020/7/27.
//

#import "ScreenUtil.h"
#import <QuartzCore/QuartzCore.h>

@implementation ScreenUtil

// 获取使用实例
+ (instancetype )sharedInstance
{
    static ScreenUtil *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[super alloc] init];
    });
    
    return sharedInstance;
}


//截图
typedef struct __IOSurface *IOSurfaceRef;
UIKIT_EXTERN CGImageRef UICreateCGImageFromIOSurface(IOSurfaceRef);
- (UIImage *)createScreenSurface {
    IOSurfaceRef ioSurfaceRef = (__bridge IOSurfaceRef)([UIWindow performSelector:@selector(createScreenIOSurface)]);
    CGImageRef cgImageRef = UICreateCGImageFromIOSurface(ioSurfaceRef);
    UIImage *Image=[UIImage imageWithCGImage:cgImageRef];
    //图片写入
    NSData *imageViewData = UIImagePNGRepresentation(Image);
    NSString *savedImagePath = [NSString stringWithFormat:@"/mnt/UICreateScreenUIImage.png"];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    [fileMgr removeItemAtPath:savedImagePath error:nil];
    bool isBooL =  [imageViewData writeToFile:savedImagePath atomically:YES];//保存照片到沙盒目录
    NSLog(@"图片写入成功 = %d",isBooL);
    CFRelease(ioSurfaceRef);
    CGImageRelease(cgImageRef);
    return Image;
}
@end
