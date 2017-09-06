//
//  DayCollectionViewCell.h
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/4/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekDayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *overlayImage;

- (void)changeStateToSelected;
- (void)changeStateToDeselected;

@end
