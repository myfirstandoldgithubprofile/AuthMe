//
//  CryptographUtil.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "CryptographUtil.h"
#import <CommonCrypto/CommonHMAC.h>

@implementation CryptographUtil

+ (NSString *)hmacForKeyAndDataWithKey:(NSString *)key data:(NSString *)data {
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    unsigned char cHMAC[CC_SHA512_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA512, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *result = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    NSUInteger capacity = result.length * 2;
    NSMutableString *hmac = [NSMutableString stringWithCapacity:capacity];
    
    const unsigned char *buf = result.bytes;
    NSInteger i;
    for (i=0; i < result.length; ++i) {
        [hmac appendFormat:@"%02lX", (unsigned long)buf[i]];
    }
    
    return hmac;
}

@end