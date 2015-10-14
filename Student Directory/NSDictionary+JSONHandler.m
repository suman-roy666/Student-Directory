//
//  NSDictionary+JSONHandler.m
//  Student Directory
//
//  Created by Suman Roy on 09/10/15.
//  Copyright (c) 2015 Suman Roy. All rights reserved.
//

#import "NSDictionary+JSONHandler.h"

@implementation NSDictionary (JSONHandler)

- (NSString*) convertToJSON{
    
    NSMutableString *JSONString = [ NSMutableString stringWithString:@"{ "];
    
    NSArray *dictionaryKeys = [ self allKeys ];
    
    for (int i = self.count ; i > 0 ; --i) {
        
        [ JSONString appendFormat: @"\"%@\" : ", dictionaryKeys[ i-1 ] ];
        
        
        if ( [[ self valueForKey:dictionaryKeys[ i-1 ] ] isKindOfClass: [ NSNumber class] ]) {
            
            [ JSONString appendFormat: @"%@, ", [ self valueForKey:[ dictionaryKeys[ i-1 ] stringValue ] ] ];
        } else {
            
            [ JSONString appendFormat: @"\"%@\", ", [ self valueForKey:[ dictionaryKeys[ i-1 ] stringValue ] ] ];
        }
        
    }
    
    [ JSONString appendString:@"}"];
    
    return [ NSString stringWithString:JSONString];
}


@end
