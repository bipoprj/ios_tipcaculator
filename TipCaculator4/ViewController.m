//
//  ViewController.m
//  TipCaculator4
//
//  Created by Bipo Tsai on 6/10/15.
//  Copyright (c) 2015 Bipo Tsai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtBill;
@property (weak, nonatomic) IBOutlet UILabel *txtTip;
@property (weak, nonatomic) IBOutlet UILabel *txtTotal;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Set the default tip percentage from the user settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipSegmentIndex = [defaults integerForKey:@"default_tip_segment_index"];
    [self.tipControl setSelectedSegmentIndex:defaultTipSegmentIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    // Set the default tip percentage from the user settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipSegmentIndex = [defaults integerForKey:@"default_tip_segment_index"];
    [self.tipControl setSelectedSegmentIndex:defaultTipSegmentIndex];
    
    // Update values since the tip percentage may have changed
    [self updateValues];
    
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues{
    float billAmount = [self.txtBill.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    self.txtTip.text = [NSString stringWithFormat:@"$ %0.2f", tipAmount];
    self.txtTotal.text = [NSString stringWithFormat:@"$ %0.2f", totalAmount];
}

@end
