//
//  DayCollectionViewCell.m
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/4/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import "DayCollectionViewCell.h"

@implementation DayCollectionViewCell

- (void)changeStateToSelected {
    UIImage * myImage = [UIImage imageNamed:@"overlayDay"];
    self.overlayImage.image = myImage;
    self.selected = YES;
}

- (void)changeStateToDeselected {
    self.overlayImage.image = nil;
    [super setNeedsDisplay];
    self.selected = NO;
}

@end
