//
//  ReservationTableViewCell.m
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/5/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import "ReservationTableViewCell.h"

@implementation ReservationTableViewCell

@synthesize reservationDate = _reservationDate;
@synthesize reservationTime = _reservationTime;
@synthesize serviceTitle = _serviceTitle;
@synthesize partySize = _partySize;
@synthesize durationTime = _durationTime;
@synthesize serviceDescription = _serviceDescription;


- (void)awakeFromNib {
    [super awakeFromNib];
    self.rescheduleButton.clipsToBounds = YES;
    self.rescheduleButton.layer.cornerRadius = 4;
    self.cancelButton.clipsToBounds = YES;
    self.cancelButton.layer.cornerRadius = 4;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
