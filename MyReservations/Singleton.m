//
//  Singleton.m
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/6/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

@synthesize reservations;

static Singleton *shared = nil;

+(Singleton *)getInstance
{
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared = [[Singleton alloc] init];
        shared.reservations = [[NSMutableArray alloc] init];
    });
    
    return shared;
}

@end
