//
//  AuthController.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "AuthController.h"
#import "AuthService.h"
#import "AuthResponseError.h"

@implementation AuthController

- (void)authenticateUser:(AuthModel *_Nonnull)authModel block:(nullable void(^)(NSError *_Nullable error))block {
    
    [AuthService requestAuthenticationWithAuthRequest:authModel block:^(NSDictionary * _Nullable jsonDictionary, NSError * _Nullable error) {
        
        if (error) {
            block(error);
            NSLog(@"%@", jsonDictionary);
        } else {
            block(nil);
            NSLog(@"%@", jsonDictionary);
        }
        
    }];
    
}

@end