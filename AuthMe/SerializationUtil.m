//
//  SerializationUtil.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "SerializationUtil.h"

@implementation SerializationUtil

+ (NSData *)composeJSONDataFromDictionary:(NSDictionary *)dict error:(NSError **)error
{
    NSData *json;
    
    // Dictionary convertable to JSON ?
    if ([NSJSONSerialization isValidJSONObject:dict]) {
        
        // Serialize the dictionary
        json = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:error];
        
        if (error && *error) {
            
            return nil;
        }
    }
    
    return json;
}

@end