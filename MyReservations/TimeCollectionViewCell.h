//
//  TimeCollectionViewCell.h
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/5/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *overlayImage;
@property (weak, nonatomic) IBOutlet UILabel *timeDayLabel;

- (void)changeStateToSelected;
- (void)changeStateToDeselected;

@end
