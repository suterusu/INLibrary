//
//  NSMutableArray+INTest.h
//  Pods
//
//  Created by Inba on 2017/12/26.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (INTest)



/*
 テストモードを開始する。
 addObject辺りが呼ばれた際にログを出す。
 **警告**
 本番環境でこのメソッドを呼ば無いでください
 */
+(void)startTest;

@end
