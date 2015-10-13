//
//  AddStudentViewController.m
//  Student Directory
//
//  Created by Suman Roy on 09/10/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import "AddStudentViewController.h"
#import "ViewController.h"

@implementation AddStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _datePickerDone.hidden = TRUE;
    _datePicker.hidden = TRUE;
    [ _dobTextBox setDelegate:self];
    
    [ _datePicker setDatePickerMode:UIDatePickerModeDate ];
    
    _gpaTextBox.keyboardType = UIKeyboardTypeDecimalPad;
    
}

- (IBAction)addStudentDetailsButtonHandler:(id)sender {
    
    NSString *tempName, *tempDoB, *tempgpa;
    NSNumberFormatter *gpaConverter = [[NSNumberFormatter alloc] init ];
    
    gpaConverter.numberStyle = NSNumberFormatterDecimalStyle;
    
    tempName = [ self.studentNameTextBox text];
    tempDoB = [ self.dobTextBox text];
    tempgpa = [  [self.gpaTextBox text ] stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceCharacterSet]];
    
    BOOL isAnyTextFieldEmpty = (
                                ( [ tempName isEqualToString:@"" ] || tempName == nil )  ||
                                ( [ tempDoB isEqualToString:@"" ] || tempDoB == nil ) ||
                                ( [ tempgpa isEqualToString:@"" ] || tempgpa == nil )
    
    );
    
    if ( isAnyTextFieldEmpty ) {
        
        [ self showErrorAlertWithMessage: @"All field are mandatory" ];
        
    }
    
    if ( ![ self validateInputWithString:tempgpa] ){
        
        [ self showErrorAlertWithMessage: @"GPA format incorrect" ];
        
    } else {
        
        [ self.temporaryDirectory addToListStudent:tempName DoB:tempDoB GPA:[ gpaConverter numberFromString:tempgpa ] ];
        
        [ self.navigationController popViewControllerAnimated:YES ];
    }
}


#pragma mark - Date of Birth text field delegate functions

- (IBAction)textFieldClicked:(id)sender {
    
    
    NSDateFormatter *dobFormatter = [[ NSDateFormatter alloc] init ];
    
    [ dobFormatter setDateFormat:@"dd/MM/yyyy"];
    
    _dobTextBox.text = [ NSString stringWithFormat:@"%@", [ dobFormatter stringFromDate:_datePicker.date]];
    
    _datePicker.hidden = false;
    _datePickerDone.hidden = false;
    
}

- (IBAction)closeDatePicker:(id)sender {
    
    _datePicker.hidden = TRUE;
    _datePickerDone.hidden = TRUE;
}

- (IBAction)datePickerValueChanged:(id)sender {
    
    NSDateFormatter *dobFormatter = [[ NSDateFormatter alloc] init ];
    
    [ dobFormatter setDateFormat:@"dd/MM/yyyy"];
    
    _dobTextBox.text = [ NSString stringWithFormat:@"%@", [ dobFormatter stringFromDate:_datePicker.date]];

}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if ( textField.tag == 2) {
        
        return FALSE;
    }
    
    return TRUE;
    
}

#pragma mark - GPA text field constaint finctions

- (BOOL)validateInputWithString:(NSString *)aString
{
    NSString * const regularExpression = @"(^[0-9][.][0-9][0-9]?)|10[.]?[0]{0,2}";
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularExpression
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    if (error) {
        NSLog(@"error %@", error);
    }
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:aString
                                                        options:0
                                                          range:NSMakeRange(0, [aString length])];
    return numberOfMatches > 0;
}

-(void) showErrorAlertWithMessage: (NSString*)errorMessage
{
    UIAlertView *ErrorAlert = [[UIAlertView alloc] initWithTitle:@""
                                                         message:errorMessage delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil, nil];
    [ErrorAlert show];
}


@end
