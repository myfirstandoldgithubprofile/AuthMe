//
//  RequestUtil.h
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestUtil : NSObject

+ (void)sendRequest:(NSMutableURLRequest *_Nullable)request withBlock:(nullable void (^)(NSDictionary *_Nullable jsonDictionary, NSError *_Nullable error))block;

@end