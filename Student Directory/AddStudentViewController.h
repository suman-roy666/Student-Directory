//
//  AddStudentViewController.h
//  Student Directory
//
//  Created by Suman Roy on 09/10/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentDirectory.h"

@interface AddStudentViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *studentNameTextBox;
@property (weak, nonatomic) IBOutlet UITextField *dobTextBox;
@property (weak, nonatomic) IBOutlet UITextField *gpaTextBox;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIToolbar *datePickerDone;
@property StudentDirectory *temporaryDirectory;

@end
