//
//  ScheduleViewController.m
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/4/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import "ScheduleViewController.h"
#import "DayCollectionViewCell.h"
#import "TimeCollectionViewCell.h"

@interface ScheduleViewController ()

@property (nonatomic, strong) UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *partySizeTextField;
@property (weak, nonatomic) IBOutlet UICollectionView *daysOfTheMonthCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *timeDayCollectionView;
@property (strong, nonatomic) NSArray *dayStrings;
@property (strong, nonatomic) NSArray *days;
@property (strong, nonatomic) NSArray *times;
@property (strong, nonatomic) NSArray *partySizes;
@property (strong, nonatomic) NSArray *dayTimes;
@property (strong, nonatomic) NSString *currentYear;
@property (weak, nonatomic) IBOutlet UILabel *currentMonthLabel;
@property (weak, nonatomic) IBOutlet UIButton *reserveButton;

@end

@implementation ScheduleViewController {
    ScheduleDay *scheduleDay;
    NSString *time;
    BOOL hasSelectedDay;
    BOOL hasSelectedTime;
    NSMutableDictionary *weekDays;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.reserveButton.alpha = 0.5;
    self.reserveButton.enabled = NO;
    
    scheduleDay = [[ScheduleDay alloc] init];
    
    ScheduleDate *date = [[ScheduleDate alloc] init];
    
    self.pickerView = [[UIPickerView alloc] init];
    self.pickerView.backgroundColor = [UIColor whiteColor];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    self.daysOfTheMonthCollectionView.delegate = self;
    self.timeDayCollectionView.delegate = self;
    
    self.daysOfTheMonthCollectionView.dataSource = self;
    self.timeDayCollectionView.dataSource = self;
    
    self.dayTimes = @[@"9:00 AM", @"10:00 AM", @"11:00 AM", @"12:00 PM", @"1:00 PM", @"2:00 PM", @"3:00 PM", @"4:00 PM", @"5:00 PM", @"6:00 PM", @"7:00 PM", @"8:00 PM"];
    
    self.partySizes = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12"];
    
    NSDate *today = [NSDate date];

    NSDateComponents *todaysComponent = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear|NSCalendarUnitWeekday fromDate:today];
    
    self.currentYear = [NSString stringWithFormat:@"%lu", [todaysComponent year]];
    
    ScheduleDate *scheduleDate = [date getScheduleDatesFromToday:todaysComponent];
    
    self.currentMonthLabel.text = scheduleDate.month;
    self.days = scheduleDate.days;
    self.times = self.dayTimes;
    
    [self.daysOfTheMonthCollectionView reloadData];
    [self.timeDayCollectionView reloadData];
    
    self.partySizeTextField.delegate = self;
    self.partySizeTextField.inputView = self.pickerView;
    
    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,44)];
    [toolBar setBarStyle:UIBarStyleDefault];
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(updatePartySize)];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(dismissPicker)];
    
    toolBar.items = @[cancel, space, done];
    
    [toolBar setItems:toolBar.items animated:YES];

    self.partySizeTextField.inputAccessoryView = toolBar;

    [self weekDayHash];
}

#pragma CustomMethods

-(void)weekDayHash
{
    weekDays = [[NSMutableDictionary alloc] init];
    
    [weekDays setObject:@"Monday" forKey:@"MON"];
    [weekDays setObject:@"Tuesday" forKey:@"TUE"];
    [weekDays setObject:@"Wednesday" forKey:@"WED"];
    [weekDays setObject:@"Thursday" forKey:@"THU"];
    [weekDays setObject:@"Friday" forKey:@"FRI"];
    [weekDays setObject:@"Saturday" forKey:@"SAT"];
    [weekDays setObject:@"Sunday" forKey:@"SUN"];
}

- (IBAction)reserveAppointment:(id)sender
{
    Service *service = [[Service alloc] init];

    service.serviceTitle = @"Hot Stone Massage";
    service.durationTime = @"1H";
    service.price = @"$120";
    service.serviceDescription = @"Massage focused on the deepest layer of muscles to target knots and release chronic muscle tension.";
    
    NSString *dayTitleStr = [NSString stringWithFormat:@"%@, %@ %@, %@", weekDays[scheduleDay.dayTitle], self.currentMonthLabel.text, scheduleDay.dayNumber, self.currentYear];
    
    service.reservationTime = time;
    
    service.reservationDate = dayTitleStr;
    
    service.partySize = [NSString stringWithFormat:@"PARTY SIZE - %@", self.partySizeTextField.text];
    
    [[Singleton getInstance].reservations addObject:service];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - PickerViewCustomMethods

-(NSArray*)getPartySizes
{
    NSMutableArray *partySizes = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 12; ++i) {
        [partySizes addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    return partySizes;
}

-(void)updatePartySize
{
    [self.partySizeTextField setText:[NSString stringWithFormat:@"%ld", (long)[self.pickerView selectedRowInComponent:0]+1]];
    [self dismissPicker];
}

-(BOOL)dismissPicker
{
    return [self.partySizeTextField resignFirstResponder];
}

#pragma mark - UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (pickerView == self.pickerView) {
        return 1;
    }
    
    return 0;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.pickerView) {
        return [self.partySizes count];
    }
    
    return 0;
}

#pragma mark - UIPickerViewDelegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == self.pickerView) {
        return self.partySizes[row];
    }
    
    return nil;
}

#pragma UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.daysOfTheMonthCollectionView) {
        return self.days.count;
    } else {
        return self.times.count;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     if (collectionView == self.daysOfTheMonthCollectionView) {
        static NSString *cellIdentifier = @"MonthDay";
        
        DayCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
         
        cell.weekDayLabel.text = [[self.days objectAtIndex:indexPath.row] valueForKey:@"dayTitle"];
        cell.dayLabel.text = [[self.days objectAtIndex:indexPath.row] valueForKey:@"dayNumber"];
        
         if (cell.selected) {
             [cell changeStateToSelected];
         } else {
             [cell changeStateToDeselected];
         }
         
         
        return cell;
    } else {
        static NSString *cellIdentifier = @"TimeDay";
        
        TimeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
        
        cell.timeDayLabel.text = [self.times objectAtIndex:indexPath.row];
        
        if (cell.selected) {
            [cell changeStateToSelected];
        } else {
            [cell changeStateToDeselected];
        }
        
        return cell;
    }
}

#pragma UICollectionViewDelegate


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.daysOfTheMonthCollectionView) {
        DayCollectionViewCell *cell = (DayCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell changeStateToSelected];
        if (indexPath.row == 0) {
            self.times = [[self.days valueForKey:@"dayTimes"] objectAtIndex:0];
            [self.timeDayCollectionView reloadData];
        } else {
            self.times = self.dayTimes;
            [self.timeDayCollectionView reloadData];
        }
        
        scheduleDay.dayNumber = [[self.days objectAtIndex:indexPath.row] valueForKey:@"dayNumber"];
        scheduleDay.dayTitle = [[self.days objectAtIndex:indexPath.row] valueForKey:@"dayTitle"];
        
        NSLog(@"day => %@ - %@", scheduleDay.dayTitle, scheduleDay.dayNumber);
        
        hasSelectedDay = YES;
    } else {
        TimeCollectionViewCell *cell = (TimeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell changeStateToSelected];
        
        time = [self.times objectAtIndex:indexPath.row];
        NSLog(@"at => %@", time);
        
        hasSelectedTime = YES;
    }
    
    if (hasSelectedDay && hasSelectedTime) {
        self.reserveButton.alpha = 1.0;
        self.reserveButton.enabled = YES;
    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.daysOfTheMonthCollectionView) {
        DayCollectionViewCell *cell = (DayCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell changeStateToDeselected];
    } else {
        TimeCollectionViewCell *cell = (TimeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell changeStateToDeselected];
    }
}



@end
