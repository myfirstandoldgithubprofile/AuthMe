//
//  AuthService.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "AuthService.h"
#import "SerializationUtil.h"
#import "RequestUtil.h"
#import "DateUtil.h"


@implementation AuthService

NSString *serviceUrl = @"https://private-anon-8d7c7cd58-globalidentity.apiary-mock.com/api/";
NSString *authUrl = @"authorization/authenticate";

+ (void)requestAuthenticationWithAuthRequest:(AuthModel *_Nonnull)authRequest block:(nullable void (^)(NSDictionary *_Nullable jsonDictionary, NSError *_Nullable error))block {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", serviceUrl, authUrl];
    
    // create dictionary
    NSDictionary *bodyParameters = @{@"Email" : authRequest.userEmail,
                                     @"Password" : authRequest.userPassword,
                                     @"ApplicationKey" : authRequest.applicationKey,
                                     @"TokenExpirationInMinutes": authRequest.tokenExpiration};
    
    // serialize json
    NSError *error = nil;
    NSData *json = [SerializationUtil composeJSONDataFromDictionary:bodyParameters error:&error];
    
    // check errors in serialization
    if (error) {
        
        block(nil, error);
        
        return;
    }

    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[json length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: json];
    
    [RequestUtil sendRequest:request withBlock:^(NSDictionary * _Nullable jsonDictionary, NSError * _Nullable error) {
        
        if (error) {
            
            block(nil, error);
            
        } else {
            
            block(jsonDictionary, nil);
        }
    }];

}

@end