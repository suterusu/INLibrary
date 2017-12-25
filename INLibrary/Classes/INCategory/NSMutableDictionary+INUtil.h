//
//  NSMutableDictionary+INUtil.h
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (INUtil)
- (void)setObjectIfNotNilAndNSNull:(NSObject *)objcet forKey:(NSString *)aKey;

@end
