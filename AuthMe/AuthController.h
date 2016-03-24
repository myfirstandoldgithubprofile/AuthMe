//
//  AuthController.h
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthModel.h"

@interface AuthController : NSObject

- (void)authenticateUser:(AuthModel *_Nonnull)authModel block:(nullable void(^)(NSError *_Nullable error))block ;

@end