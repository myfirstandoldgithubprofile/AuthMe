//
//  AuthModel.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "AuthModel.h"

@implementation AuthModel

@synthesize responseErrors;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    self.userEmail = [dictionary objectForKey:@"Email"];
    self.userPassword = [dictionary objectForKey:@"Password"];
    self.applicationKey = [dictionary objectForKey:@"ApplicationKey"];
    self.tokenExpiration = [dictionary objectForKey:@"TokenExpirationInMinutes"];
    
    responseErrors = [[NSMutableArray alloc] init];
    
    for (NSDictionary *errorDictionary in [dictionary objectForKey:@"errors"])
    {
        AuthResponseError *error = [[AuthResponseError alloc] initWithDictionary:errorDictionary];
        
        [responseErrors addObject:error];
    }
    
    return self;
}

@end