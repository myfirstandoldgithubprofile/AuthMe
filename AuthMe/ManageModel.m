//
//  ManageModel.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "ManageModel.h"

@implementation ManageModel

@synthesize responseErrors;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    self.userEmail = [dictionary objectForKey:@"Email"];
    self.applicationKey = [dictionary objectForKey:@"ApplicationKey"];
    
    responseErrors = [[NSMutableArray alloc] init];
    
    for (NSDictionary *errorDictionary in [dictionary objectForKey:@"errors"])
    {
        ManageResponseError *error = [[ManageResponseError alloc] initWithDictionary:errorDictionary];
        
        [responseErrors addObject:error];
    }
    
    return self;
}

@end