//
//  UIViewController+ViewControllerUnit.h
//  ComponentizationTest
//
//  Created by Veblen on 2020/6/4.
//  Copyright © 2020 Jinfu_Li. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ViewControllerUnit)
///获取当前控制器
+ (UIViewController*)currentViewController;
///获取顶层控制器
+ (UIViewController *)appRootViewController;
@end

NS_ASSUME_NONNULL_END
