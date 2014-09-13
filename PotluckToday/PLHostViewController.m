//
//  PLHostViewController.m
//  PotluckToday
//
//  Created by Ryan Wu on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import "PLHostViewController.h"
#import "PLReviewViewController.h"
#import "Potluck.h"

@interface PLHostViewController ()
{
    UITextField *refTextField;
    UIDatePicker* picker;
    CGSize pickerSize;
    Potluck *newPotluck;
}

@property (weak, nonatomic) IBOutlet UITextField *partyNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *contactTextField;

@end

@implementation PLHostViewController

@synthesize timeLabel, partyNameTextField, locationTextField, contactTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];

    picker  = [[UIDatePicker alloc] init];
    picker.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    picker.datePickerMode = UIDatePickerModeDateAndTime;
    picker.minuteInterval = 30;
    pickerSize = [picker sizeThatFits:CGSizeZero];
    picker.frame = CGRectMake(0, self.view.bounds.size.height, pickerSize.width, pickerSize.height);
    picker.backgroundColor = [UIColor whiteColor];
    [picker addTarget:self action:@selector(dueDateChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:picker];

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showDatePicker)];
    [timeLabel addGestureRecognizer:tapGestureRecognizer];
    timeLabel.userInteractionEnabled = YES;

    partyNameTextField.delegate = self;
    locationTextField.delegate = self;
    contactTextField.delegate = self;
        
    newPotluck = [Potluck new];
    newPotluck.time = [NSDate date];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    refTextField = textField;
    [self displayDatePicker:NO];

}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

-(void) showDatePicker
{
    [refTextField resignFirstResponder];
    [self displayDatePicker:YES];
}

-(void) displayDatePicker: (BOOL) show
{
    [UIView beginAnimations:nil context:UIGraphicsGetCurrentContext()];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.6];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    picker.frame = CGRectMake(0, show ?
                                self.view.bounds.size.height - pickerSize.height :
                                self.view.bounds.size.height,
                              pickerSize.width,
                              pickerSize.height);
    [UIView commitAnimations];
}

-(void) dueDateChanged:(UIDatePicker *)sender {
    newPotluck.time = [sender date];
    timeLabel.text = [newPotluck getPartyTime];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    newPotluck.name = partyNameTextField.text;
    newPotluck.location = locationTextField.text;
    newPotluck.contact = contactTextField.text;
    if([[segue identifier] isEqualToString:@"partyDetail"]) {
        PLReviewViewController *reviewVC = segue.destinationViewController;
        reviewVC.potluck = newPotluck;
    }
}
@end
