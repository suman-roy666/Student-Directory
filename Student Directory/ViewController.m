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

typedef enum{
    
    SEARCH,
    SHOW
    
}Mode;

@interface ViewController ()

@end

@implementation ViewController{
    
    int directoryIndex;
    Mode displayMode;
    NSMutableArray *filteredDirectory;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _internationalSchoolDirectory = [[StudentDirectory alloc] init];
    
    displayMode = SHOW;
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    _studentDetailsTableView.estimatedRowHeight = 44.0;
    _studentDetailsTableView.rowHeight = UITableViewAutomaticDimension;
    
    NSPredicate *test = [ NSPredicate predicateWithFormat:@"(Name LIKE[cd] $letter) "];
    
    NSLog(@"PREDICATE: %@", [ _internationalSchoolDirectory.studentList filteredArrayUsingPredicate:[ test predicateWithSubstitutionVariables:@{@"letter": @"*Rahul*"}] ] );
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [ _studentDetailsTableView reloadData];
    
    //[ self.someValue setValue:@"89" forKey:@"stringValue"];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table UI functions

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *studentTableCellIdentifier = @"protoCel";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:studentTableCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:studentTableCellIdentifier];
    }
    
    NSDictionary *studentDetails = ( displayMode == SHOW ) ?  _internationalSchoolDirectory.studentList[ indexPath.row ] : filteredDirectory [ indexPath.row ];
    
    cell.textLabel.text = [ studentDetails valueForKey:@"Name" ];
    cell.textLabel.numberOfLines = 0;
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (displayMode) {
            
        case SHOW:
            return _internationalSchoolDirectory.studentList.count;
            break;
            
        case SEARCH:
            return filteredDirectory.count;
            break;
            
        default:
            return 0;
            break;
    }
    
}

#pragma mark - Other functions

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    AddStudentViewController *targetController = (AddStudentViewController *)segue.destinationViewController;
    targetController.temporaryDirectory = self.internationalSchoolDirectory;
    
    if ( [segue.identifier isEqualToString:@"editStudentSegue"] ){
        
        NSIndexPath *indexPath = [ self.studentDetailsTableView indexPathForSelectedRow ];
        targetController.directoryIndex = indexPath.row;
        
    }
}

- (IBAction)searchButtonHandler:(id)sender {

    displayMode = SEARCH;
    
    NSPredicate *searchPredicate = [  NSPredicate predicateWithFormat:@"(Name LIKE[cd] $letter) "];
    
    NSString *filterString = [ NSString stringWithFormat:@"*%@*", self.searchNameField.text ];
    
    filteredDirectory = [ _internationalSchoolDirectory.studentList filteredArrayUsingPredicate:[ searchPredicate predicateWithSubstitutionVariables:@{@"letter": filterString}] ] ;
    
    [ self.studentDetailsTableView reloadData];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    NSLog(@"Some value changed");
    
}

@end
