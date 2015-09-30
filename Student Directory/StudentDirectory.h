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
@property NSArray *studentList;

/**
 *  A function to display the student details on the console
 *
 *  @param student The dictionary item containing the student information
 */

+(void)displayStudent:(NSDictionary*) student;

@end
