//
//  SettingViewController.m
//  TipCaculator4
//
//  Created by Bipo Tsai on 6/11/15.
//  Copyright (c) 2015 Bipo Tsai. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultSelector;
- (IBAction)onTap:(id)sender;
- (void)updateDefaultTip;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initialize the view with the current default tip percentage
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipSegmentIndex = [defaults integerForKey:@"default_tip_segment_index"];
    [self.defaultSelector setSelectedSegmentIndex:defaultTipSegmentIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)viewWillDisappear:(BOOL)animated
{
    [self updateDefaultTip];

}
- (void)updateDefaultTip {
    // Save the default tip percentage
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultSelector.selectedSegmentIndex forKey:@"default_tip_segment_index"];
    [defaults synchronize];
}
- (IBAction)onTap:(id)sender {
    NSLog(@"defaultSelector %d", self.defaultSelector.selectedSegmentIndex);
}
@end
