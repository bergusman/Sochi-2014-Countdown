//
//  VBSochiLabel.m
//  Sochi 2014 Countdown
//
//  Created by Vitaly Berg on 24/01/14.
//  Copyright (c) 2014 Vitaly Berg. All rights reserved.
//

#import "VBSochiLabel.h"

@implementation VBSochiLabel

- (void)setFont:(UIFont *)font {
    font = [UIFont fontWithName:@"Sochi2014" size:font.pointSize];
    [super setFont:font];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.font = self.font;
}

@end
