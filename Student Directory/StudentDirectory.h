//
//  StudentDirectory.h
//  Student Directory
//
//  Created by Suman Roy on 30/09/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentDirectory : NSObject

@property NSArray *studentList;

+(void)displayStudent:(NSDictionary*) student;

@end
