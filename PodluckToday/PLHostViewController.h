//
//  PLHostViewController.h
//  PotluckToday
//
//  Created by Ryan Wu on 8/5/14.
//  Copyright (c) 2014 Ereo Creatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECDefaultViewController.h"

@interface PLHostViewController : ECDefaultViewController

@property (weak, nonatomic) IBOutlet UITextField *partyNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *contactTextField;

@end
