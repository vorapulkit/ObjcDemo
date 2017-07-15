//
//  List.h
//  BodyAlignPro
//
//  Created by Pulkit on 7/5/17.
//  Copyright © 2017 Pulkeet. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface List : NSObject

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *fullName;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *profileThumbImgURL;
@property (nonatomic, retain) NSString *profileImgURL;


-(id)initWithData:(NSDictionary *)dict;

@end
