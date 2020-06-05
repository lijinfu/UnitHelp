//
//  NSObject+MessageBox.h
//  ComponentizationTest
//
//  Created by Veblen on 2020/6/5.
//  Copyright © 2020 Jinfu_Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,LocationType)
{
    topLocationType,///顶部
    middleLocationType,///居中
    bottomLocationType,///底部
};
@interface NSObject (MessageBox)

///浮层提示
- (void) floatingPromptMessage:(NSString *) message timeDelay:(float) times location:(LocationType) type;

///警告窗 只有确定按钮
- (void)SP_alertVCWithTitle:(NSString *)title andMessage:(NSString *)msg actionTitle:(NSString *)str1 confirmBlock:(void(^)(void))block;

///警告窗 中间(左边灰色按钮，右边是蓝色高亮按钮)
- (void) SP_alertVCInKeywindowWithTitle:(NSString *)title andMessage:(NSString *)msg actionWithTitleLeft:(NSString *)str1 TitleRight:(NSString *)str2 rejectBlock:(void(^)(void))rejectBlock confirmBlock:(void(^)(void))block;

///警告窗 中间(左边红色警示按钮，右边是蓝色高亮按钮)
- (void) SP_alertWarningVCInKeywindowWithTitle:(NSString *)title andMessage:(NSString *)msg actionWithTitleLeft:(NSString *)str1 TitleRight:(NSString *)str2 rejectBlock:(void(^)(void))rejectBlock confirmBlock:(void(^)(void))block;

///警告窗 底下
- (void)SP_alertActionSheetWithTitle:(NSString *)title andMessage:(NSString *)msg actionWithTitle1:(NSString *)str1 actionWithTitle2:(NSString *)str2 Block1:(void(^)(void))block1 Block2:(void(^)(void))block2;

///警告窗底下有3个
-(void)SP_alertActionSheetWithTitle:(NSString *)title andMessage:(NSString *)msg actionWithTitle1:(NSString *)str1 actionWithTitle2:(NSString *)str2 actionWithTitle3:(NSString *)str3 Block1:(void (^)(void))block1 Block2:(void (^)(void))block2 Block3:(void (^)(void))block3;

///警告窗底下有4个
-(void)SP_alertActionSheetWithTitle:(NSString *)title andMessage:(NSString *)msg actionWithTitle1:(NSString *)str1 actionWithTitle2:(NSString *)str2 actionWithTitle3:(NSString *)str3 actionWithTitle4:(NSString *)str4 Block1:(void (^)(void))block1 Block2:(void (^)(void))block2 Block3:(void (^)(void))block3 Block4:(void (^)(void))block4;

@end

NS_ASSUME_NONNULL_END
