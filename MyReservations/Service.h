//
//  Service.h
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/6/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Service : NSObject

@property (strong, nonatomic)  NSString *reservationDate;
@property (strong, nonatomic)  NSString *reservationTime;
@property (strong, nonatomic)  NSString *serviceTitle;
@property (strong, nonatomic)  NSString *partySize;
@property (strong, nonatomic)  NSString *durationTime;
@property (strong, nonatomic)  NSString *serviceDescription;
@property (strong, nonatomic)  NSString *price;

@end
