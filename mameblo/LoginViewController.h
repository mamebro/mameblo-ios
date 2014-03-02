//
//  LoginViewController.h
//  mameblo
//
//  Created by Keisuke KITA on 2014/02/22.
//  Copyright (c) 2014年 Keisuke KITA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginViewController;

@protocol LoginViewControllerDelegate
- (void)loginViewControllerDidFinish:(LoginViewController *)controller;
@end

@interface LoginViewController : UIViewController
@property (weak, nonatomic) id <LoginViewControllerDelegate> delegate;
@end
