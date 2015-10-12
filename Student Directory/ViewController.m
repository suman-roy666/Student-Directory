//
//  ViewController.m
//  Student Directory
//
//  Created by Suman Roy on 30/09/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import "ViewController.h"
#import "StudentDirectory.h"
#import "AddStudentViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateOfBirthLabel;
@property (weak, nonatomic) IBOutlet UILabel *gpaLabel;



@end

@implementation ViewController{
    
    int directoryIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _previousButton.enabled = FALSE;
    
    _internationalSchoolDirectory = [[StudentDirectory alloc] init];
    
    directoryIndex = 0;
    
    NSDictionary *temporaryInstance = _internationalSchoolDirectory.studentList[ directoryIndex];
    
    [ self setLabelTextFrom: temporaryInstance];
    
    if (  (directoryIndex+1) >=  _internationalSchoolDirectory.studentList.count) {
        
        _nextButton.enabled = FALSE;
        
    }
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}

- (IBAction)nextButtonTapHandler:(id)sender {
    
    _previousButton.enabled = TRUE;
    
    NSDictionary *temporaryInstance = _internationalSchoolDirectory.studentList[++directoryIndex];
    
    
    [ self setLabelTextFrom: temporaryInstance];
    
    if (  (directoryIndex+1) >=  _internationalSchoolDirectory.studentList.count) {
        
        _nextButton.enabled = FALSE;
        
    }
    
}


- (IBAction)previousButtonTapHandler:(id)sender {
    
    _nextButton.enabled = TRUE;
    
    NSDictionary *temporaryInstance = _internationalSchoolDirectory.studentList[--directoryIndex];
    
    [ self setLabelTextFrom: temporaryInstance];
    
    if (  (directoryIndex-1) == -1) {
        
        _previousButton.enabled = FALSE;
    }
}

- (void)setLabelTextFrom:(NSDictionary*) studentDetails{
    
    [ StudentDirectory displayStudent:studentDetails];
    
    [ self.nameLabel         setText:studentDetails[@"Name"] ];
    [ self.dateOfBirthLabel  setText:studentDetails[@"DoB"] ];
    [ self.gpaLabel          setText: [ studentDetails[@"GPA"] stringValue ] ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"addStudentSegue"]){
        
        AddStudentViewController *controller = (AddStudentViewController *)segue.destinationViewController;
        controller.temporaryDirectory = self.internationalSchoolDirectory;
    }
}


@end
