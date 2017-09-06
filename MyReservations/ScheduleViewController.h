//
//  ScheduleViewController.h
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/4/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScheduleDate.h"
#import "Service.h"
#import "Singleton.h"

@interface ScheduleViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *serviceTitle;
@property (weak, nonatomic) IBOutlet UILabel *servicePrice;
@property (weak, nonatomic) IBOutlet UILabel *serviceDuration;
@property (weak, nonatomic) IBOutlet UILabel *serviceDescription;

@end
