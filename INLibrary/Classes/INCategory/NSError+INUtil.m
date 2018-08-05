//
//  NSError+INUtil.m
//  INLibrary
//
//  Created by Inba on 2018/08/05.
//

#import "NSError+INUtil.h"

@implementation NSError (INUtil)

-(NSString *)userSettinglocalizedDescription{
    if ([[self.userInfo objectForKey:NSLocalizedDescriptionKey] isKindOfClass:[NSString class]]) {
        return [self.userInfo objectForKey:NSLocalizedDescriptionKey];
    }
    
    return nil;
}

@end
