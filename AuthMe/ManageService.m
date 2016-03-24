//
//  ManageService.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "ManageService.h"
#import "SerializationUtil.h"
#import "RequestUtil.h"
#import "DateUtil.h"

@implementation ManageService

NSString *serviceUrl = @"https://private-anon-8d7c7cd58-globalidentity.apiary-mock.com/api/management/";

+ (void)requestUserRolesWithManageRequest:(ManageModel *_Nonnull)manageRequest block:(nullable void (^)(NSDictionary *_Nullable jsonDictionary, NSError *_Nullable error))block {


}


@end