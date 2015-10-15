//
//  ViewController.h
//  Student Directory
//
//  Created by Suman Roy on 30/09/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentDirectory.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property StudentDirectory* internationalSchoolDirectory;
@property (weak, nonatomic) IBOutlet UITableView *studentDetailsTableView;
@property (weak, nonatomic) IBOutlet UITextField *searchNameField;
@property NSNumber *someValue;

@end

