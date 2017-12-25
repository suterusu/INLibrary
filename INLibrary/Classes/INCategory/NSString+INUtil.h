//
//  NSString+INUtil.h
//  Pods
//
//  Created by Inba on 2017/12/24.
//
//

#import <Foundation/Foundation.h>

@interface NSString (INUtil)


//改行文字の数+1
-(NSInteger)lineNumber;

-(BOOL)isConsitOfOnlyDigit;
-(BOOL)isConsitOfOnlyASCII;

//unixのmd5コマンドと同等の物
- (NSString *)MD5Hash;

//指定した時間を端末のタイムゾーンで見てGregorianカレンダーかつen_US_POSIXロケートでの文字列へ変更
+ (NSString *)dateToString:(NSDate *)date atDateFormat:(NSString *)format;

@end
