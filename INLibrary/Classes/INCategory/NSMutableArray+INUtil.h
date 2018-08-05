//
//  NSMutableArray+INUtil.h
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (INUtil)

-(void)enqueue:(id)obj;
-(id)dequeue;
- (void)shuffle;

@end
