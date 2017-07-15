//
//  cellList.h
//  DemoObjc
//
//  Created by Pulkit on 7/5/17.
//  Copyright © 2017 Pulkeet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellList : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgViewProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDesc;

@end
