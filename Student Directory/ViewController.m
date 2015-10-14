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

@end

@implementation ViewController{
    
    int directoryIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _internationalSchoolDirectory = [[StudentDirectory alloc] init];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    _studentDetailsTableView.estimatedRowHeight = 44.0;
    _studentDetailsTableView.rowHeight = UITableViewAutomaticDimension;

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *studentTableCellIdentifier = @"StudentTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:studentTableCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:studentTableCellIdentifier];
    }
    
    NSDictionary *studentDetails = _internationalSchoolDirectory.studentList[ indexPath.row];
    
    cell.textLabel.text = [ studentDetails valueForKey:@"Name" ];
    cell.textLabel.numberOfLines = 0;
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [ _internationalSchoolDirectory.studentList count ];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"addStudentSegue"]){
        
        AddStudentViewController *controller = (AddStudentViewController *)segue.destinationViewController;
        controller.temporaryDirectory = self.internationalSchoolDirectory;
    }
}


@end
