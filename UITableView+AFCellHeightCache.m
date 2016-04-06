//
//  UITableView+AFCellHeightCache.m
//  CellHeightCache
//
//  Created by 口贷网 on 16/4/6.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import "UITableView+AFCellHeightCache.h"
#import <objc/runtime.h>



@interface AFCellHeightCache ()
@property (nonatomic, strong) NSMutableDictionary<id<NSCopying>, NSNumber *> *heightCache;
@end

@implementation AFCellHeightCache

- (instancetype)init
{
    self = [super init];
    if (self) {
        _heightCache = [NSMutableDictionary dictionary];
    }
    return self;
}

- (BOOL)existsHeightForKey:(id<NSCopying>)key {
    NSNumber *number = self.heightCache[key];
    return number && ![number isEqualToNumber:@-1];
}

- (void)cacheHeight:(CGFloat)height byIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [NSString stringWithFormat:@"%ld", indexPath.row];
    self.heightCache[key] = @(height);
    NSLog(@"   %@ === %@", key , self.heightCache[key]);
}

- (void)cacheHeight:(CGFloat)height byKey:(id<NSCopying>)key {
    self.heightCache[key] = @(height);
}

- (CGFloat)heightForKey:(id<NSCopying>)key {
#if CGFLOAT_IS_DOUBLE 
    return [self.heightCache[key] doubleValue];
#else
    return [self.heightCache[key] floatValue];
#endif
}

- (void)removeHeightForKey:(id<NSCopying>)key {
    [self.heightCache removeObjectForKey:key];
}

- (void)removeAllHeight {
    [self.heightCache removeAllObjects];
}

@end

@implementation UITableView (AFCellHeightCache)

- (AFCellHeightCache *)af_cellHeightCache {
    AFCellHeightCache *cache = objc_getAssociatedObject(self, _cmd);
    if (!cache) {
        cache = [AFCellHeightCache new];
        objc_setAssociatedObject(self, _cmd, cache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return cache;
}


@end
