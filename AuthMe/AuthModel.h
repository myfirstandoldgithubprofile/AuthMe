//
//  AuthModel.h
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthResponseError.h"

@interface AuthModel : NSObject <ResponseErrorDelegate>

@property (strong, nonatomic) NSString *userEmail;
@property (strong, nonatomic) NSString *userPassword;
@property (strong, nonatomic) NSString *applicationKey; // GUID
@property (strong, nonatomic) NSNumber *tokenExpiration; // in minutes

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end