//
//  JsonParser.m
//  AskMe
//
//  Created by Punit Bansal on 26/10/15.
//  Copyright © 2015 ios dev. All rights reserved.
//

#import "JsonParser.h"

@implementation JsonParser

+ (id)parseJSON:(NSData *)object error:(NSError **)error
{
    NSError *localError = nil;
    id parsedObject = [NSJSONSerialization JSONObjectWithData:object options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    return parsedObject;
}

@end
