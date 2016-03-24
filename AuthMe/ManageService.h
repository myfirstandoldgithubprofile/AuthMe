//
//  ManageService.h
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ManageModel.h"

@interface ManageService : NSObject

+ (void)requestUserRolesWithManageRequest:(ManageModel *_Nonnull)manageRequest block:(nullable void (^)(NSDictionary *_Nullable jsonDictionary, NSError *_Nullable error))block;

@end