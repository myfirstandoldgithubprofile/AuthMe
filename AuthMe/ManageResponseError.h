//
//  ManageResponseError.h
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseError.h"

@interface ManageResponseError : NSObject

@property (strong, nonatomic) NSError *error;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end