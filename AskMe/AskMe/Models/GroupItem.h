//
//  GroupItem.h
//  AskMe
//
//  Created by Punit Bansal on 26/10/15.
//  Copyright © 2015 ios dev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    eTemplate1,
    eTemplate2,
    eTemplate3
}Template;

@interface GroupItem : NSObject
{
    
}

@property (nonatomic, assign) Template templateType;
@property (nonatomic, strong) NSArray * items;
@property (nonatomic, strong) NSString * titleString;

+(instancetype)itemFromObject:(NSDictionary *)object;

@end
