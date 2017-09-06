//
//  ScheduleDate.m
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/5/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import "ScheduleDate.h"

@interface ScheduleDate()

@end

@implementation ScheduleDate

-(ScheduleDate*)getScheduleDatesFromToday:(NSDateComponents *)todaysComponent
{
    ScheduleDate *scheduleDate = [[ScheduleDate alloc] init];
    
    scheduleDate.month = [self getMonthNameBy:(int)[todaysComponent month]];
    scheduleDate.days = [self getScheduleDaysStartingFromToday:todaysComponent];
    
    return scheduleDate;
}

-(NSString*)getMonthNameBy:(int)monthNumber
{
    NSDateFormatter *formate = [NSDateFormatter new];

    NSArray *monthNames = [formate standaloneMonthSymbols];
    NSString *monthName = [monthNames objectAtIndex:(monthNumber - 1)];

    return monthName;
}

-(NSArray*)getScheduleDaysStartingFromToday:(NSDateComponents*)component
{
    NSMutableArray *arrayScheduleDays = [[NSMutableArray alloc] init];
    
    int daysLeftInMonthFromToday = (int)[self getNumberOfDaysInMonth:(int)[component month]]-(int)[component day];
    
    int weekCounter = (int)component.weekday;
    
    for (int i = 0; i <= daysLeftInMonthFromToday; i++) {
        ScheduleDay *scheduleDay = [[ScheduleDay alloc] init];
        
        [component setWeekday:weekCounter];
        NSString *dayNumber = [NSString stringWithFormat:@"%d", (int)[component day]];
        NSString *dayTitle;
        
        dayTitle = [NSString stringWithFormat:@"%@", [self getStringDayFromWeekday:(int)[component weekday]]];
        weekCounter++;
        
        if (weekCounter > 7) {
            weekCounter = 1;
        }
        
        scheduleDay.dayNumber = dayNumber;
        scheduleDay.dayTitle = dayTitle;
        
        NSArray *dayTimes;
        if (!i) {
            dayTimes = [self getTimesBasedOnDay:YES];
        } else {
            dayTimes = [self getTimesBasedOnDay:NO];
        }
        
        scheduleDay.dayTimes = dayTimes;
        
        [arrayScheduleDays addObject:scheduleDay];
        
        [component setDay:component.day+1];
    }
    
    return arrayScheduleDays;
}

-(NSArray*)getTimesBasedOnDay:(BOOL)isCurrentDay
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour|NSCalendarUnitMinute fromDate:[NSDate date]];
    
    NSInteger hour = [components hour];
    
    NSArray *dayTimes = @[@"9:00 AM", @"10:00 AM", @"11:00 AM", @"12:00 PM", @"1:00 PM", @"2:00 PM", @"3:00 PM", @"4:00 PM", @"5:00 PM", @"6:00 PM", @"7:00 PM", @"8:00 PM"];
    
    if (!isCurrentDay) {
        return dayTimes;
    } else {
        NSMutableArray *dayTimesCurrent = [[NSMutableArray alloc] init];
        if (hour >= 9 && hour <= 19) {
            for (int i = (int)hour-8; i < [dayTimes count]; ++i) {
                [dayTimesCurrent addObject:[dayTimes objectAtIndex:i]];
            }
            return dayTimesCurrent;
        } else {
            return dayTimes;
        }
    }
}

-(NSInteger)getNumberOfDaysInMonth:(int)monthNumber
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = range.length;

    return numberOfDaysInMonth;
}

- (NSString *)getStringDayFromWeekday:(int)weekday
{
    NSDateFormatter * dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    if (weekday != 0) {
        weekday-=1;
    }
    
    return [dateFormatter.shortWeekdaySymbols[weekday] uppercaseString];
}

@end
