//
//  DateUtil.h
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

/// Creates date from date string from server (yyyy'-'MM'-'dd'T'HH':'mm':'ss)
+ (NSDate *)dateWithStringFormated:(NSString *)dateString;

/// Creates date from date string with slash (dd/MM/yyyy)
+ (NSDate *)dateWithStringSlash:(NSString *)dateString;

/// Creates string date with slash (dd/MM/yyyy) from NSDate
+ (NSString *)dateStringSlashWithDate:(NSDate *)date;

/// Creates string date with format (yyyy'-'MM'-'dd'T'HH':'mm':'ss) from NSDate
+ (NSString *)dateStringFormatedWithDate:(NSDate *)date;

/// Creates string date with hyphen (dd-MM-yyyy) from NSDate
+ (NSString *)dateStringHyphenWithDate:(NSDate *)date;

/// Creates string hour (HH:mm) from NSDate
+ (NSString *)hourStringWithDate:(NSDate *)date;

@end
