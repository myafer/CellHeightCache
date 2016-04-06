//
//  UITableView+AFCellHeightCache.h
//  CellHeightCache
//
//  Created by 口贷网 on 16/4/6.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFCellHeightCache : NSObject

- (BOOL)existsHeightForKey:(id<NSCopying>)key;
- (CGFloat)heightForKey:(id<NSCopying>)key;
- (void)cacheHeight:(CGFloat)height byKey:(id<NSCopying>)key;
- (void)cacheHeight:(CGFloat)height byIndexPath:(NSIndexPath *)indexPath;
- (void)removeHeightForKey:(id<NSCopying>)key;
- (void)removeAllHeight;
@end

@interface UITableView (AFCellHeightCache)
- (AFCellHeightCache *)af_cellHeightCache;
@end
