//
//  JsonParser.h
//  AskMe
//
//  Created by Punit Bansal on 26/10/15.
//  Copyright © 2015 ios dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonParser : NSObject

+ (id)parseJSON:(NSData *)object error:(NSError **)error;

@end
