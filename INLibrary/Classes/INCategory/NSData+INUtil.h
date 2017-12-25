//
//  NSData+INUtil.h
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import <Foundation/Foundation.h>

@interface NSData (INUtil)
- (id)deflate:(int)compressionLevel;
- (id)inflate;
@end
