//
//  ManageController.h
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ManageModel.h"

@interface ManageController : NSObject

- (void)showUserRoles:(ManageModel *_Nonnull)manageModel block:(nullable void (^)(NSError *_Nullable error))block;

@end
