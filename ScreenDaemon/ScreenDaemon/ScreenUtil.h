//
//  ScreenUtil.h
//  ScreenDaemon
//
//  Created by SuperChao on 2020/7/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScreenUtil : NSObject

+ (instancetype )sharedInstance;
-(UIImage *)createScreenSurface;
@end

NS_ASSUME_NONNULL_END
