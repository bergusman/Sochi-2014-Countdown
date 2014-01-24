//
//  VBMainViewController.m
//  Sochi 2014 Countdown
//
//  Created by Vitaly Berg on 24/01/14.
//  Copyright (c) 2014 Vitaly Berg. All rights reserved.
//

#import "VBMainViewController.h"

@interface VBMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *daysTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsTitleLabel;

@end

@implementation VBMainViewController

#pragma mark - Setups

- (void)setupBackground {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
}

- (void)setupLocalizableStrings {
    self.titleLabel.text = NSLocalizedString(@"title", @"");
    self.daysTitleLabel.text = NSLocalizedString(@"days", @"");
    self.hoursTitleLabel.text = NSLocalizedString(@"hours", @"");
    self.minutesTitleLabel.text = NSLocalizedString(@"minutes", @"");
    self.secondsTitleLabel.text = NSLocalizedString(@"seconds", @"");
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBackground];
    [self setupLocalizableStrings];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

@end
