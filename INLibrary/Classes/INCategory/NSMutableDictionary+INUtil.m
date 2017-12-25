//
//  NSMutableDictionary+INUtil.m
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import "NSMutableDictionary+INUtil.h"

@implementation NSMutableDictionary (INUtil)
- (void)setObjectIfNotNilAndNSNull:(NSObject *)objcet forKey:(NSString *)aKey{
    if ((objcet != nil)&&
        (objcet != [NSNull null])) {
        [self setObject:objcet forKey:aKey];
    }
}
@end
