//
//  ScheduleViewController.m
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/4/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import "ScheduleViewController.h"

@interface ScheduleViewController ()

@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UIButton *reserveButton;
@property (weak, nonatomic) IBOutlet UITableView *datesSelected;

@end

@implementation ScheduleViewController
    

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.reserveButton.alpha = 0.5;
    self.reserveButton.enabled = NO;
}

- (IBAction)reserveAppointment:(id)sender {
    NSLog(@"opa");
}



//- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//
//}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


@end
