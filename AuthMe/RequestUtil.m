//
//  RequestUtil.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "RequestUtil.h"

@implementation RequestUtil

+ (void)sendRequest:(NSMutableURLRequest *_Nullable)request withBlock:(nullable void (^)(NSDictionary *_Nullable jsonDictionary, NSError *_Nullable error))block
{
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task;
    
    request.timeoutInterval = 30; // timeout
    
    NSLog(@"%@", request.URL);
    
    // send request
    task = [session dataTaskWithRequest:request
                      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                          
                          if (error) {
                              
                              block(nil, error);
                              
                          } else {
                              
                              NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                             options:0
                                                                                               error:nil];
                              
                              block(jsonDictionary, nil);
                          }
                      }];
    
    [task resume];
}

@end