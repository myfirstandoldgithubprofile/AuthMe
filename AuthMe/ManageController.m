//
//  ManageController.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "ManageController.h"
#import "ManageService.h"
#import "ManageResponseError.h"

@implementation ManageController

- (void)showUserRoles:(ManageModel *_Nonnull)manageModel block:(nullable void (^)(NSError *_Nullable error))block {

    [ManageService requestUserRolesWithManageRequest:manageModel block:^(NSDictionary * _Nullable jsonDictionary, NSError * _Nullable error) {
       
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