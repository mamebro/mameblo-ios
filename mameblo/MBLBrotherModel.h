//
//  MBLBrotherModel.h
//  mameblo
//
//  Created by Keisuke KITA on 2014/03/02.
//  Copyright (c) 2014年 Keisuke KITA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBLBrotherModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *token;


+ (MBLBrotherModel *)sharedManager;

- (BOOL) isSignedIn;
- (void) saveUserData:(NSDictionary *)params;


@end
