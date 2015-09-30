//
//  StudentDirectory.m
//  Student Directory
//
//  Created by Suman Roy on 30/09/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import "StudentDirectory.h"

@implementation StudentDirectory

- (id)init
{
    self = [super init];
    if (self) {
        
        //Create dictionary items of students
        
        NSDictionary *student1 = @{
                                   @"Name" : @"Rahul Srivastava",
                                   @"DoB"  : @"14/02/1991",
                                   @"GPA"  : [ NSNumber numberWithFloat:6.43 ]
                                   };
        
        NSDictionary *student2 = @{
                                   @"Name" : @"Barbara Gordon",
                                   @"DoB"  : @"17/04/1987",
                                   @"GPA"  : [ NSNumber numberWithFloat:8.53 ]
                                   };
        
        NSDictionary *student3 = @{
                                   @"Name" : @"Pandit Gangadhar Vidyadhar Mayadhar Omkarnath Shastri",
                                   @"DoB"  : @"22/09/1997",
                                   @"GPA"  : [ NSNumber numberWithFloat:10.00 ]
                                   };
        
        NSDictionary *student4 = @{
                                   @"Name" : @"Chandi Gupta",
                                   @"DoB"  : @"28/02/1993",
                                   @"GPA"  : [ NSNumber numberWithFloat:7.58]
                                   };
        
        NSDictionary *student5 = @{
                                   @"Name" : @"Tim Drake",
                                   @"DoB"  : @"16/08/1989",
                                   @"GPA"  : [ NSNumber numberWithFloat:7.00 ]
                                   };
        
        _studentList = @[
                         student1,
                         student2,
                         student3,
                         student4,
                         student5
                         ];
        
    }
    return self;
}

@end
