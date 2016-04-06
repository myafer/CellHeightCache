//
//  TTableViewCell.h
//  CellHeightCache
//
//  Created by 口贷网 on 16/4/6.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTableViewCell : UITableViewCell
@property (strong, nonatomic) NSString *str;
@property (weak, nonatomic) IBOutlet UILabel *L;


- (void)config;
@end
