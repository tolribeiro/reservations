//
//  ReservationsViewController.m
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/4/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import "ReservationsViewController.h"
#import "ReservationTableViewCell.h"


@interface ReservationsViewController () {
    NSArray *reservations;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITableView *reservationsTableview;

@end

@implementation ReservationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Service *service = [[Service alloc] init];
    
    service.reservationDate = @"Monday, March 26, 2016";
    service.reservationTime = @"2:00 PM";
    service.serviceTitle = @"Gel Manicure";
    service.partySize = @"PARTY SIZE-1";
    service.durationTime = @"30M";
    service.serviceDescription = @"Get the upper hand with our chip-resistant, mirror-finish gel polish that requires no drying time and last up to two weeks.";
    
    [Singleton getInstance].reservations[0] = service;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[Singleton getInstance].reservations count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 243;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *productIdentifier = @"ReservationViewCell";
    
    ReservationTableViewCell *cell = (ReservationTableViewCell*)[tableView dequeueReusableCellWithIdentifier:productIdentifier];
    
    if (cell == nil) {
        NSArray *nib        = [[NSBundle mainBundle] loadNibNamed:@"ReservationViewCell" owner:self options:nil];
        cell                = [nib objectAtIndex:0];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    Service *service = [[Singleton getInstance].reservations objectAtIndex:indexPath.row];
    
    cell.reservationDate.text = service.reservationDate;
    cell.reservationTime.text = service.reservationTime;
    cell.serviceTitle.text = service.serviceTitle;
    cell.partySize.text = service.partySize;
    cell.durationTime.text = service.durationTime;
    cell.serviceDescription.text = service.serviceDescription;
    
    return cell;
}

@end
