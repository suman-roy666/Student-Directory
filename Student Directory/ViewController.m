//
//  ViewController.m
//  Student Directory
//
//  Created by Suman Roy on 30/09/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import "ViewController.h"
#import "StudentDirectory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    StudentDirectory *internationalSchoolDirectory = [[StudentDirectory alloc] init];
    
    int directoryIndex = 0;
}

- (IBAction)nextButtonTapHandler:(id)sender {
}


- (IBAction)previousButtonTapHandler:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
