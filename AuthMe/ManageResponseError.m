//
//  ManageResponseError.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "ManageResponseError.h"

@implementation ManageResponseError

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    NSNumber *code = [dictionary objectForKey:@"code"];
    
    NSString *description = [dictionary objectForKey:@"message"];
    NSString *field = [dictionary objectForKey:@"field"] == nil ? @"" : [dictionary objectForKey:@"field"];
    
    NSDictionary *info = @{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"%@ (%@)", description, field]};
    
    self.error = [self errorWithErrorCode:[code integerValue] userInfo:info];
    
    return self;
}

- (NSError *)errorWithErrorCode:(NSInteger)errorCode userInfo:(NSDictionary *)userInfo
{
    NSString *flipDomain = @"br.com.stone.flip";
    
    NSError *error = [NSError errorWithDomain:flipDomain code:errorCode userInfo:userInfo];
    return error;
}

@end