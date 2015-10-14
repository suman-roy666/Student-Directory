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
        
        NSDictionary *student = [[ NSDictionary alloc] init ];
        
        [ student setValue:@"Rahul Srivastava" forKey:@"Name" ];
        [ student setValue:@"14/02/1991" forKey:@"DoB" ];
        [ student setValue:[ NSNumber numberWithFloat: 6.43 ] forKey:@"GPA" ];
        
        [ _studentList addObject:student ];
        
        [ student setValue:@"Barbara Gordon" forKey:@"Name" ];
        [ student setValue:@"17/04/1987" forKey:@"DoB" ];
        [ student setValue:[ NSNumber numberWithFloat: 8.53] forKey:@"GPA" ];
        
        [ _studentList addObject:student ];
        
        [ student setValue:@"Pandit Gangadhar Vidyadhar Mayadhar Omkarnath Shastri" forKey:@"Name" ];
        [ student setValue:@"22/09/1997" forKey:@"DoB" ];
        [ student setValue:[ NSNumber numberWithFloat:10 ] forKey:@"GPA" ];
        
        [ _studentList addObject:student ];
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
    
    NSDictionary *student = [[ NSDictionary alloc] init ];
    
    [ student setValue:name forKey:@"Name" ];
    [ student setValue:DoB forKey:@"DoB" ];
    [ student setValue:GPA forKey:@"GPA" ];
    
    [ _studentList addObject:student ];
}


@end
