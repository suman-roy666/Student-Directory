//
//  StudentDirectory.m
//  Student Directory
//
//  Created by Suman Roy on 30/09/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import "StudentDirectory.h"
#import "NSDictionary+JSONHandler.h"

#define JSON_OUTPUT

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
        
        _studentList = [ NSMutableArray arrayWithArray: @[
                         student1,
                         student2,
                         student3,
                         student4,
                         student5
                         ] ];
        
        [ student1 convertToJSON];
        
    }
    
    return self;
}

+(void) displayStudent:(NSDictionary*) student{
    
#ifndef JSON_OUTPUT
    
    NSLog(@"Name\t\t\t: %@",student[@"Name"]);
    NSLog(@"Date of Birth\t: %@",student[@"DoB"]);
    NSLog(@"GPA\t\t\t: %@",student[@"GPA"]);
    
#else
    
    NSLog(@"%@", [ student convertToJSON ] );
    
#endif
    
}

-(void)addToListStudent: (NSString*) name DoB: (NSString*) DoB GPA: (NSNumber*) GPA{
    
    NSDictionary *student = @{
                               @"Name" : name,
                               @"DoB"  : DoB,
                               @"GPA"  : GPA
                               };
    
    [ _studentList addObject:student ];
}


@end
