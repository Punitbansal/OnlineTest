//
//  Item.h
//  AskMe
//
//  Created by Punit Bansal on 26/10/15.
//  Copyright © 2015 ios dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * webUrl;
@property (nonatomic, strong) NSString * imageUrl;

+(instancetype)itemFromObject:(NSDictionary *)object;

@end
