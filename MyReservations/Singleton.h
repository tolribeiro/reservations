//
//  Singleton.h
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/6/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property (nonatomic, retain) NSMutableArray *reservations;

+(Singleton *)getInstance;

@end
