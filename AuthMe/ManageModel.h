//
//  ManageModel.h
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ManageResponseError.h"

@interface ManageModel : NSObject <ResponseErrorDelegate>

@property (strong, nonatomic) NSString *userEmail;
@property (strong, nonatomic) NSString *applicationKey; // GUID

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end