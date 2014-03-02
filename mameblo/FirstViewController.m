//
//  FirstViewController.m
//  mameblo
//
//  Created by Keisuke KITA on 2014/02/22.
//  Copyright (c) 2014年 Keisuke KITA. All rights reserved.
//

#import "FirstViewController.h"

#import "AFNetworkActivityIndicatorManager.h"
#import "LoginViewController.h"


@interface FirstViewController ()
{
    LoginViewController *loginViewController;
}
@end

@implementation FirstViewController
- (IBAction)openWindow:(id)sender {
    loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginScene"];
    [loginViewController setDelegate:self];
    [self presentViewController:loginViewController animated:YES completion:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    /*loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginScene"];
    [loginViewController setDelegate:self];
    [self presentViewController:loginViewController animated:YES completion:nil];*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginViewControllerDidFinish:(LoginViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
