//
//  NSObject+MessageBox.m
//  ComponentizationTest
//
//  Created by Veblen on 2020/6/5.
//  Copyright © 2020 Jinfu_Li. All rights reserved.
//

#import "NSObject+MessageBox.h"

@implementation NSObject (MessageBox)
///浮层提示
- (void) floatingPromptMessage:(NSString *) message timeDelay:(float) times location:(LocationType) type
{
    MBProgressHUD *tempHud=[MBProgressHUD showHUDAddedTo:[self topViewController].view animated:YES];
    tempHud.bezelView.backgroundColor = [UIColor blackColor];
    [tempHud setMode:MBProgressHUDModeText];
    tempHud.label.numberOfLines = 0;
    tempHud.userInteractionEnabled = NO;
    tempHud.label.text = message;
    tempHud.label.textColor = [UIColor whiteColor];
    if (type == topLocationType) {
        tempHud.offset = CGPointMake(10, 200);
    }
    else if (type == bottomLocationType)
    {
        tempHud.offset = CGPointMake(10, -100);
    }
    [[[UIApplication sharedApplication].windows firstObject] addSubview:tempHud];
    [tempHud setRemoveFromSuperViewOnHide:YES];
    [tempHud hideAnimated:YES afterDelay:times];
}
///警告窗 只有确定按钮
- (void)SP_alertVCWithTitle:(NSString *)title andMessage:(NSString *)msg actionTitle:(NSString *)str1 confirmBlock:(void(^)(void))block{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:str1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block();
        }
    }]];
    [[self topViewController] presentViewController:alertVC animated:YES completion:nil];
}

///警告窗 中间(左边灰色按钮，右边是蓝色高亮按钮)
- (void) SP_alertVCInKeywindowWithTitle:(NSString *)title andMessage:(NSString *)msg actionWithTitleLeft:(NSString *)str1 TitleRight:(NSString *)str2 rejectBlock:(void(^)(void))rejectBlock confirmBlock:(void(^)(void))block {

    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
   UIAlertAction *leftAction= [UIAlertAction actionWithTitle:str1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (rejectBlock) {
            rejectBlock();
        }
    }];
    [leftAction setValue:[[PublicFun Instance]getGreyColor] forKey:@"titleTextColor"];///设置按钮颜色
    [alertVC addAction:leftAction];
    [alertVC addAction:[UIAlertAction actionWithTitle:str2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block();
        }
    }]];
    [[self topViewController] presentViewController:alertVC animated:YES completion:nil];
}

///警告窗 中间(左边红色警示按钮，右边是蓝色高亮按钮)
- (void) SP_alertWarningVCInKeywindowWithTitle:(NSString *)title andMessage:(NSString *)msg actionWithTitleLeft:(NSString *)str1 TitleRight:(NSString *)str2 rejectBlock:(void(^)(void))rejectBlock confirmBlock:(void(^)(void))block
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *leftAction= [UIAlertAction actionWithTitle:str1 style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (rejectBlock) {
            rejectBlock();
        }
    }];
//    [leftAction setValue:[[PublicFun Instance]getGreyColor] forKey:@"titleTextColor"];///设置按钮颜色
    [alertVC addAction:leftAction];
    [alertVC addAction:[UIAlertAction actionWithTitle:str2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block();
        }
    }]];
    [[self topViewController] presentViewController:alertVC animated:YES completion:nil];
}


///警告窗 底下
- (void)SP_alertActionSheetWithTitle:(NSString *)title andMessage:(NSString *)msg actionWithTitle1:(NSString *)str1 actionWithTitle2:(NSString *)str2 Block1:(void(^)(void))block1 Block2:(void(^)(void))block2{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVC addAction:[UIAlertAction actionWithTitle:str1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block1) {
            block1();
        }
    }]];
    
    if (str2.length > 0) {
        [alertVC addAction:[UIAlertAction actionWithTitle:str2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (block2) {
                block2();
            }
        }]];
    }
   
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}]];
    [[self topViewController] presentViewController:alertVC animated:YES completion:nil];
}

///警告窗, 底下有3个
-(void)SP_alertActionSheetWithTitle:(NSString *)title andMessage:(NSString *)msg actionWithTitle1:(NSString *)str1 actionWithTitle2:(NSString *)str2 actionWithTitle3:(NSString *)str3 Block1:(void (^)(void))block1 Block2:(void (^)(void))block2 Block3:(void (^)(void))block3{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVC addAction:[UIAlertAction actionWithTitle:str1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block1) {
            block1();
        }
    }]];
    
    if (str2.length > 0) {
        [alertVC addAction:[UIAlertAction actionWithTitle:str2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (block2) {
                block2();
            }
        }]];
    }
    
    if (str3.length > 0) {
        [alertVC addAction:[UIAlertAction actionWithTitle:str3 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (block3) {
                block3();
            }
        }]];
    }
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}]];
    [[self topViewController] presentViewController:alertVC animated:YES completion:nil];
}

///警告窗底下有4个
-(void)SP_alertActionSheetWithTitle:(NSString *)title andMessage:(NSString *)msg actionWithTitle1:(NSString *)str1 actionWithTitle2:(NSString *)str2 actionWithTitle3:(NSString *)str3 actionWithTitle4:(NSString *)str4 Block1:(void (^)(void))block1 Block2:(void (^)(void))block2 Block3:(void (^)(void))block3 Block4:(void (^)(void))block4{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVC addAction:[UIAlertAction actionWithTitle:str1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (block1) {
            block1();
        }
    }]];
    
    if (str2.length > 0) {
        [alertVC addAction:[UIAlertAction actionWithTitle:str2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (block2) {
                block2();
            }
        }]];
    }
    
    if (str3.length > 0) {
        [alertVC addAction:[UIAlertAction actionWithTitle:str3 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (block3) {
                block3();
            }
        }]];
    }
    if (str4.length > 0) {
        [alertVC addAction:[UIAlertAction actionWithTitle:str4 style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (block4) {
                block4();
            }
        }]];
    }

    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [[self topViewController] presentViewController:alertVC animated:YES completion:nil];
}

- (UIViewController *)topViewController{
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].windows firstObject].rootViewController];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}


@end
