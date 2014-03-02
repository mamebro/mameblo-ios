//
//  LoginViewController.m
//  mameblo
//
//  Created by Keisuke KITA on 2014/02/22.
//  Copyright (c) 2014年 Keisuke KITA. All rights reserved.
//

#import "LoginViewController.h"

#import <AFHTTPRequestOperationManager.h>
#import "MBLBrotherModel.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *brotherNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.passwordField setSecureTextEntry:YES];
    self.bottomConstraint.constant = 150;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signinButton:(id)sender {
    MBLBrotherModel *brother = [MBLBrotherModel sharedManager];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *params = @{@"name": self.brotherNameField.text,
                             @"password": self.passwordField.text};
    [manager POST:@"https://www.mameblo.com/api/signin" parameters: params
           success:^(AFHTTPRequestOperation *operation, id responseObject) {
               [brother saveUserData:@{@"name": self.brotherNameField.text, @"token": operation.responseString}];
               [self.delegate loginViewControllerDidFinish:self];
           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               NSLog(@"%@", error);
           }
        ];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    CGRect keyboardFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    self.bottomConstraint.constant = keyboardFrame.size.height + 10;
    
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    NSTimeInterval duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    self.bottomConstraint.constant = 150;
    
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
