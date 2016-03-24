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
#import "CryptographUtil.h"

@implementation ManageService

NSString *manageUrl = @"https://private-anon-8d7c7cd58-globalidentity.apiary-mock.com/api/management/";
NSString *timestamp;
NSString *secretKey = @"EDB9B3E627DAFF8C063B63A44A6D8854DE176C6C";
NSString *apiKey = @"00000000-0000-0000-0000-000000000000";
NSString *nonce = @"mimimi";

+ (void)requestUserRolesWithManageRequest:(ManageModel *_Nonnull)manageRequest block:(nullable void (^)(NSDictionary *_Nullable jsonDictionary, NSError *_Nullable error))block {

    // Authorization: hmac apiKey:requestTimeStamp:nonce:hashedSequence
    
    timestamp = [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]];
    
    NSString * hmac = [NSString stringWithFormat:@"hmac %@:%@:%@:%@", apiKey, timestamp, nonce, [CryptographUtil hmacForKeyAndDataWithKey:secretKey data:@"foostring"]];
    
    NSLog(@"HMAC%@ ", hmac);
    
    // https://private-anon-8d7c7cd58-globalidentity.apiary-mock.com/api/management/00000000-0000-0000-0000-000000000000/users/email/roles
    
   // NSString *url = [NSString stringWithFormat:@"%@%@/users/%@/roles", manageUrl, apiKey, manageRequest.userEmail];
    
    NSString *url = @"https://private-anon-8d7c7cd58-globalidentity.apiary-mock.com/api/management/00000000-0000-0000-0000-000000000000/users/email/roles"; // mocked URL
    
    // create dictionary
    NSDictionary *bodyParameters = @{@"Email" : manageRequest.userEmail,
                                     @"ApplicationKey" : manageRequest.applicationKey};
    
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
    [request setValue:hmac forHTTPHeaderField:@"Authorization"];
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