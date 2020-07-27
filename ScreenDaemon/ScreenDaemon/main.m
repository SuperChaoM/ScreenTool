//
//  main.c
//  ScreenDaemon
//
//  Created by SuperChao on 2020/7/27.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

#include <stdio.h>
#include <UIKit/UIKit.h>
#import "ScreenUtil.h"


int main (int argc, const char * argv[])
{

    
    ScreenUtil *taskMan = [[ScreenUtil alloc] init];
    NSTimer *timer = [NSTimer timerWithTimeInterval:10 target:taskMan selector:@selector(createScreenSurface) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    while (true){
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    [timer invalidate];
    NSLog(@"结束: daemond is end!");
   
	return 0;
}

