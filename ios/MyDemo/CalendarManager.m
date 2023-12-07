//
//  CalendarManager.m
//  MyDemo
//
//  Created by Qiang Ma on 2023/12/7.
//

#import "CalendarManager.h"
#import <React/RCTLog.h>

@implementation CalendarManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
  RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSDictionary *dic = @{@"name":name, @"location":location};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"calendarNotification" object:dic];
    });
}

@end
