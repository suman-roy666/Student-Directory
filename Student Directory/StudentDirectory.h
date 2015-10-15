//
//  StudentDirectory.h
//  Student Directory
//
//  Created by Suman Roy on 30/09/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentDirectory : NSObject
/**
 *  An array that contains the information about the students. Each individual student's information is stores in the form of a dictionary item.
 */
@property (readonly) NSMutableArray *studentList;

/**
 *  A function to display the student details on the console
 *
 *  @param student The dictionary item containing the student information
 */

+(void)displayStudent:(NSDictionary*) student;

/**
 *  Used to add elements to the studentList Mutable Array.
 *
 *  @param name The name of the student to be added
 *  @param DoB  The studednt's date of birth in DD/MM/YYYY in a NSString
 *  @param GPA  The student's GPA as a NSNumber
 */

-(void)addToListStudent: (NSString*) name DoB: (NSString*) DoB GPA: (NSNumber*) GPA;

/**
 *  Used to edit elements in the studentList Mutable Array.
 *
 *  @param name The name of the student to be added
 *  @param DoB  The studednt's date of birth in DD/MM/YYYY in a NSString
 *  @param GPA  The student's GPA as a NSNumber
 */

-(void)addToListStudent:(NSString *)name DoB:(NSString *)DoB GPA:(NSNumber *)GPA atIndex: (NSInteger) index;

@end
