//
//  VBMainViewController.m
//  Sochi 2014 Countdown
//
//  Created by Vitaly Berg on 24/01/14.
//  Copyright (c) 2014 Vitaly Berg. All rights reserved.
//

#import "VBMainViewController.h"

@interface VBMainViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *firstDisciplineImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondDisciplineImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *countdownPanel;

@property (weak, nonatomic) IBOutlet UILabel *daysTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *daysLabel;
@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;

@property (strong, nonatomic) NSTimer *disciplineTimer;
@property (assign, nonatomic) NSInteger disciplineIndex;

@property (strong, nonatomic) NSTimer *countdownTimer;

@property (assign, nonatomic) BOOL lightTheme;

@end

@implementation VBMainViewController

#pragma mark - Setups

- (void)setupBackground {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-pattern"]];
}

- (void)setupTheme {
    if (self.lightTheme) {
        self.titleLabel.textColor = VB_RGB(20, 97, 171);
        self.daysTitleLabel.textColor = VB_RGB(20, 97, 171);
        self.hoursTitleLabel.textColor = VB_RGB(20, 97, 171);
        self.minutesTitleLabel.textColor = VB_RGB(20, 97, 171);
        self.secondsTitleLabel.textColor = VB_RGB(20, 97, 171);
    }
}

- (void)setupLocalizableStrings {
    self.titleLabel.text = NSLocalizedString(@"title", @"");
    self.daysTitleLabel.text = NSLocalizedString(@"days", @"");
    self.hoursTitleLabel.text = NSLocalizedString(@"hours", @"");
    self.minutesTitleLabel.text = NSLocalizedString(@"minutes", @"");
    self.secondsTitleLabel.text = NSLocalizedString(@"seconds", @"");
}

#pragma mark - Content

- (void)startDisciplineTimer {
    self.disciplineTimer = [NSTimer scheduledTimerWithTimeInterval:4
                                                            target:self
                                                          selector:@selector(disciplineOnTime:)
                                                          userInfo:nil
                                                           repeats:YES];
}

- (void)disciplineOnTime:(id)sender {
    self.disciplineIndex = (self.disciplineIndex + 1) % 15 + 1;
    NSString *imageName = [NSString stringWithFormat:@"discipline-%ld", (long)self.disciplineIndex];
    UIImage *image = [UIImage imageNamed:imageName];
    
    UIImageView *toHideImageView = self.firstDisciplineImageView.alpha > 0.1 ? self.firstDisciplineImageView : self.secondDisciplineImageView;
    
    UIImageView *toShowImageView = self.firstDisciplineImageView.alpha < 0.1 ? self.firstDisciplineImageView : self.secondDisciplineImageView;
    
    toShowImageView.image = image;
    
    CGPoint c = toShowImageView.center;
    
    toShowImageView.alpha = 0.2;
    toShowImageView.center = CGPointMake(480, c.y);
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.65 initialSpringVelocity:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toShowImageView.center = CGPointMake(160, c.y);
        toHideImageView.center = CGPointMake(-160, c.y);
    } completion:^(BOOL finished) {
        
        toHideImageView.alpha = 0;
    }];
}

- (void)startCountdownTimer {
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                           target:self
                                                         selector:@selector(countdownOnTime:)
                                                         userInfo:nil
                                                          repeats:YES];
}

- (void)countdownOnTime:(id)sender {
    NSDate *from = [NSDate date];
    NSDate *to = [NSDate dateWithTimeIntervalSince1970:1391789640];
    
    NSCalendarUnit units = NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [[NSCalendar autoupdatingCurrentCalendar] components:units fromDate:from toDate:to options:0];
    
    self.daysLabel.text = [NSString stringWithFormat:@"%02ld", (long)components.day];
    self.hoursLabel.text = [NSString stringWithFormat:@"%02ld", (long)components.hour];
    self.minutesLabel.text = [NSString stringWithFormat:@"%02ld", (long)components.minute];
    self.secondsLabel.text = [NSString stringWithFormat:@"%02ld", (long)components.second];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTheme];
    [self setupBackground];
    [self setupLocalizableStrings];
    
    self.firstDisciplineImageView.alpha = 0;
    self.secondDisciplineImageView.alpha = 0;
    
    [self disciplineOnTime:nil];
    [self startDisciplineTimer];
    
    [self countdownOnTime:nil];
    [self startCountdownTimer];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.lightTheme ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (VB_IS_IPHONE_5) {
        self = [super initWithNibName:@"VBMainViewController-568h" bundle:nil];
    } else {
        self = [super initWithNibName:@"VBMainViewController" bundle:nil];
    }
    if (self) {
        self.lightTheme = [[[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey] hasSuffix:@"light"];
    }
    return self;
}

@end
