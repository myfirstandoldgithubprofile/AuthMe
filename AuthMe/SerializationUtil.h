//
//  SerializationUtil.h
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SerializationUtil : NSObject

+ (NSData *)composeJSONDataFromDictionary:(NSDictionary *)dict error:(NSError **)error;

@end