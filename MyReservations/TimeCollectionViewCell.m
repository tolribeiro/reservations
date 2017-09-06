//
//  TimeCollectionViewCell.m
//  MyReservations
//
//  Created by Thiago Ribeiro on 9/5/17.
//  Copyright © 2017 Thiago Ribeiro. All rights reserved.
//

#import "TimeCollectionViewCell.h"

@implementation TimeCollectionViewCell

- (void)changeStateToSelected {
    UIImage * myImage = [UIImage imageNamed:@"overlayTime"];
    self.overlayImage.image = myImage;
    self.selected = YES;
}

- (void)changeStateToDeselected {
    self.overlayImage.image = nil;
    [super setNeedsDisplay];
    self.selected = NO;
}

@end
