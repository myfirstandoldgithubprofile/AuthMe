//
//  DateUtil.m
//  AuthMe
//
//  Created by Erika Bueno on 3/24/16.
//  Copyright © 2016 ErikaBueno. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

+ (NSDate *)dateWithStringFormated:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss";
    
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    return date;
}

+ (NSDate *)dateWithStringSlash:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    return date;
}

+ (NSString *)dateStringSlashWithDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd/MM/yyyy";
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

+ (NSString *)dateStringFormatedWithDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss";
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

+ (NSString *)dateStringHyphenWithDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

+ (NSString *)hourStringWithDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

@end
