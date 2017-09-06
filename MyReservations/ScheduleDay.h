//
//  ScheduleDay.h
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/5/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleDay : NSObject

@property(nonatomic, strong) NSString *dayTitle;
@property(nonatomic, strong) NSString *dayNumber;
@property(nonatomic, strong) NSString *dayYear;
@property(nonatomic, strong) NSString *dayMonth;
@property(nonatomic, strong) NSArray *dayTimes;

@end
