//
//  StudentDirectory.m
//  Student Directory
//
//  Created by Suman Roy on 30/09/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import "StudentDirectory.h"
#import "NSDictionary+JSONHandler.h"

//#define JSON_OUTPUT

@implementation StudentDirectory

- (id)init
{
    self = [super init];
    if (self) {
        
        _studentList = [[ NSMutableArray alloc] init ];
        
        //Create dictionary items of students
        
        NSMutableDictionary *student = [[ NSMutableDictionary alloc] init ];
        
        [ student setValue:@"Rahul Srivastava" forKey:@"Name" ];
        [ student setValue:@"14/02/1991" forKey:@"DoB" ];
        [ student setValue:[ NSNumber numberWithFloat: 6.43 ] forKey:@"GPA" ];
        
        [ _studentList addObject:student ];
        
        NSMutableDictionary *student2 = [[ NSMutableDictionary alloc] init ];
        
        [ student2 setValue:@"Barbara Gordon" forKey:@"Name" ];
        [ student2 setValue:@"17/04/1987" forKey:@"DoB" ];
        [ student2 setValue:[ NSNumber numberWithFloat: 8.53] forKey:@"GPA" ];
        
        [ _studentList addObject:student2 ];
        
        NSMutableDictionary *student3 = [[ NSMutableDictionary alloc] init ];
        
        [ student3 setValue:@"Pandit Gangadhar Vidyadhar Mayadhar Omkarnath Shastri" forKey:@"Name" ];
        [ student3 setValue:@"22/09/1997" forKey:@"DoB" ];
        [ student3 setValue:[ NSNumber numberWithFloat:10 ] forKey:@"GPA" ];
        
        [ _studentList addObject:student3 ];
        
        NSMutableDictionary *student4 = [[ NSMutableDictionary alloc] init ];
        
        [ student4 setValue:@"Jaqual Haggar" forKey:@"Name" ];
        [ student4 setValue:@"23/06/1997" forKey:@"DoB" ];
        [ student4 setValue:[ NSNumber numberWithFloat:5.45 ] forKey:@"GPA" ];
        
        [ _studentList addObject:student4 ];
        
        NSMutableDictionary *student5 = [[ NSMutableDictionary alloc] init ];
        
        [ student5 setValue:@"Reverand Lovejoy" forKey:@"Name" ];
        [ student5 setValue:@"22/09/1987" forKey:@"DoB" ];
        [ student5 setValue:[ NSNumber numberWithFloat:3.76 ] forKey:@"GPA" ];
        
        [ _studentList addObject:student5 ];
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
    
    NSMutableDictionary *student = [[ NSMutableDictionary alloc] init ];
    
    [ student setValue:name forKey:@"Name" ];
    [ student setValue:DoB forKey:@"DoB" ];
    [ student setValue:GPA forKey:@"GPA" ];
    
    [ _studentList addObject:student ];
}


-(void)addToListStudent:(NSString *)name DoB:(NSString *)DoB GPA:(NSNumber *) GPA atIndex: (NSInteger) index{
    
    NSMutableDictionary *student = [ _studentList objectAtIndex:index ];
    
    [ student setValue:name forKey:@"Name" ];
    [ student setValue:DoB forKey:@"DoB" ];
    [ student setValue:GPA forKey:@"GPA" ];
    
    //[ _studentList addObject:student ];
    
}

@end
