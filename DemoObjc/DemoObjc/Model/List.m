//
//
//  List.h
//  DemoObjc
//
//  Created by Pulkit on 7/5/17.
//  Copyright © 2017 Pulkeet. All rights reserved.
//

#import "List.h"

@implementation List

-(id)init
{
    if (self = [super init])
    {
        
    }
    return self;
}

-(id)initWithData:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        _firstName = [dict valueForKey:@""];
        _lastName = [dict valueForKey:@""];
        _fullName = [dict valueForKey:@""];
        _address = [dict valueForKey:@""];
        _profileThumbImgURL = [dict valueForKey:@""];
        _profileImgURL = [dict valueForKey:@""];
    }
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:_firstName forKey:@"_firstName"];
    [encoder encodeObject:_lastName forKey:@"_lastName"];
    [encoder encodeObject:_fullName forKey:@"_fullName"];
    [encoder encodeObject:_address forKey:@"_address"];
    [encoder encodeObject:_profileThumbImgURL forKey:@"_profileThumbImgURL"];
    [encoder encodeObject:_profileImgURL forKey:@"_profileImgURL"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        _firstName = [decoder decodeObjectForKey:@"_firstName"];
        _lastName = [decoder decodeObjectForKey:@"_lastName"];
        _fullName = [decoder decodeObjectForKey:@"_fullName"];
        _address = [decoder decodeObjectForKey:@"_address"];
        _profileThumbImgURL = [decoder decodeObjectForKey:@"_profileThumbImgURL"];
        _profileImgURL = [decoder decodeObjectForKey:@"_profileImgURL"];
    }
    return self;
}

@end
