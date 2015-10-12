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
       
}

- (IBAction)addStudentDetailsButtonHandler:(id)sender {
    
    NSString *tempName, *tempDoB, *tempgpa;
    NSNumberFormatter *gpaConverter = [[NSNumberFormatter alloc] init ];
    
    gpaConverter.numberStyle = NSNumberFormatterDecimalStyle;
    
    tempName = [ self.studentNameTextBox text];
    tempDoB = [ self.dobTextBox text];
    tempgpa = [  [self.gpaTextBox text ] stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceCharacterSet]];
    
    [ self.temporaryDirectory addToListStudent:tempName DoB:tempDoB GPA:[ gpaConverter numberFromString:tempgpa ] ];
    
    [ self.navigationController popViewControllerAnimated:YES ];
}

@end
