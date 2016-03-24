//
//  AuthService.h
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthModel.h"

@interface AuthService : NSObject

+ (void)requestAuthenticationWithAuthRequest:(AuthModel *_Nonnull)authRequest block:(nullable void (^)(NSDictionary *_Nullable jsonDictionary, NSError *_Nullable error))block;

@end