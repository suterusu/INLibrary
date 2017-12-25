//
//  NSMutableArray+INUtil.m
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import "NSMutableArray+INUtil.h"

@implementation NSMutableArray (INUtil)

- (void)shuffle
{
    NSUInteger count = [self count];
    if (count < 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end
