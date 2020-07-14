//
//  ValDate.m
//  WeChatExtension
//
//  Created by Eastman on 2020/7/13.
//  Copyright © 2020 MustangYM. All rights reserved.
//

#import "ValDate.h"

@implementation ValDate

+(void)checkValData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(300 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        NSString *msg = YMLanguage(@"请安装正式版!",@"Please Install Release Version!");
        NSAlert *alert = [NSAlert alertWithMessageText:YMLanguage(@"警告", @"WARNING")
                                         defaultButton:YMLanguage(@"取消", @"cancel")                       alternateButton:YMLanguage(@"退出",@"quit")
                                           otherButton:nil                              informativeTextWithFormat:@"%@", msg];
        NSUInteger action = [alert runModal];
        if (action == NSAlertAlternateReturn) {
            __weak __typeof (self) wself = self;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    [[NSApplication sharedApplication] terminate:wself];
                });
            });
        }  else if (action == NSAlertDefaultReturn) {
            [self checkValData];
        }
    });
}

@end
