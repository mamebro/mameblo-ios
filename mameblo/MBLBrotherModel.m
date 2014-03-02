//
//  MBLBrotherModel.m
//  mameblo
//
//  Created by Keisuke KITA on 2014/03/02.
//  Copyright (c) 2014年 Keisuke KITA. All rights reserved.
//

#import "MBLBrotherModel.h"

@implementation MBLBrotherModel

static NSString *userDefaultsKey = @"brother";
static MBLBrotherModel *_sharedInstance = nil;

+ (MBLBrotherModel *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MBLBrotherModel alloc] init];
        [_sharedInstance loadUserData];
    });
    
    return _sharedInstance;
}

- (void)loadUserData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userData = [defaults dictionaryForKey:userDefaultsKey];
    [self updateUserData:userData];
}

- (BOOL)isSignedIn
{
    return !!self.token;
}

- (void)saveUserData:(NSDictionary *)userData
{
    [self updateUserData:userData];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userData forKey:userDefaultsKey];
    [defaults synchronize];
}


- (void)updateUserData:(NSDictionary *)userData
{
    self.name = [userData objectForKey:@"name"];
    self.token = [userData objectForKey:@"token"];
}
@end
