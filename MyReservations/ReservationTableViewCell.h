//
//  ReservationTableViewCell.h
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/5/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReservationTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *rescheduleButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UILabel *reservationDate;
@property (weak, nonatomic) IBOutlet UILabel *reservationTime;
@property (weak, nonatomic) IBOutlet UILabel *serviceTitle;
@property (weak, nonatomic) IBOutlet UILabel *partySize;
@property (weak, nonatomic) IBOutlet UILabel *durationTime;
@property (weak, nonatomic) IBOutlet UILabel *serviceDescription;

@end
