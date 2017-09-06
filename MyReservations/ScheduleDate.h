//
//  ScheduleDate.h
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/5/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScheduleDay.h"

@interface ScheduleDate : NSObject

@property(nonatomic, strong) NSString *month;
@property(nonatomic, strong) NSArray *days;

-(ScheduleDate*)getScheduleDatesFromToday:(NSDateComponents *)todaysComponent;

@end
