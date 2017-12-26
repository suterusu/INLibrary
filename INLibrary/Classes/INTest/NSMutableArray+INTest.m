//
//  NSMutableArray+INTest.m
//  Pods
//
//  Created by Inba on 2017/12/26.
//
//
#import <objc/runtime.h>
#import "NSMutableArray+INTest.h"

@implementation NSMutableArray (INTest)
-(void)logAddObject:(id)anObject{
    NSLog(@"logAddObject_%@",anObject);
    [self logAddObject:anObject];
}

-(void)logRemoveObject:(id)anObject{
    NSLog(@"logRemoveObject_%@",anObject);
    [self logRemoveObject:anObject];
}

-(void)logRemoveAllObjects{
    NSLog(@"logRemoveAllObjects");
    [self logRemoveAllObjects];
}

-(void)logremoveObjectsInArray:(NSArray *)otherArray{
    NSLog(@"logremoveObjectsInArray");
    [self logremoveObjectsInArray:otherArray];
}

-(void)logremoveObjectAtIndex:(NSUInteger)index{
    NSLog(@"logremoveObjectAtIndex");
    [self logremoveObjectAtIndex:index];
}

-(void)logremoveLastObject{
    NSLog(@"logremoveLastObject");
    [self logremoveLastObject];
}

-(void)logremoveObjectsInRange:(NSRange)range{
    NSLog(@"logremoveObjectsInRange");
    [self logremoveObjectsInRange:range];
}


+(void)switchLoggingMethod
{
    [self switchInstanceMethodFrom:@selector(removeAllObjects)        To:@selector(logRemoveAllObjects)       ];
    [self switchInstanceMethodFrom:@selector(removeObject:)        To:@selector(logRemoveObject:)       ];
    [self switchInstanceMethodFrom:@selector(addObject:)    To:@selector(logAddObject:)   ];
    [self switchInstanceMethodFrom:@selector(removeObjectsInArray:)    To:@selector(logremoveObjectsInArray:)   ];
    [self switchInstanceMethodFrom:@selector(removeObjectAtIndex:)    To:@selector(logremoveObjectAtIndex:)   ];
    [self switchInstanceMethodFrom:@selector(removeLastObject)    To:@selector(logremoveLastObject)   ];
    [self switchInstanceMethodFrom:@selector(removeObjectsInRange:)    To:@selector(logremoveObjectsInRange:)   ];
}

+(void)switchInstanceMethodFrom:(SEL)from To:(SEL)to
{
    Method fromMethod = class_getInstanceMethod(self,from);
    Method toMethod   = class_getInstanceMethod(self,to  );
    method_exchangeImplementations(fromMethod, toMethod);
}
@end
