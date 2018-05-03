//
//  NSString+INUtil.m
//  Pods
//
//  Created by Inba on 2017/12/24.
//
//

#import "NSString+INUtil.h"
#import <CommonCrypto/CommonCrypto.h>


@implementation NSString (INUtil)

-(NSString *)newlineToSpaceText{
    NSArray *split = [self componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    split = [split filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"length > 0"]];
    NSString *res = [split componentsJoinedByString:@" "];
    return res;
}

-(NSInteger)lineNumber{
    return [self componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]].count;
}

-(BOOL)isConsitOfOnlyDigit{
    //invertedSetは逆を作る
    NSCharacterSet *nonDigitCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSRange r = [self rangeOfCharacterFromSet:nonDigitCharacterSet];
    return r.location == NSNotFound && self.length > 0;
}
-(BOOL)isConsitOfOnlyASCII{
    NSCharacterSet *nonAsciiWithoutSpaceCharacterSet = [[NSCharacterSet characterSetWithRange:NSMakeRange(0x21, 0x5e)] invertedSet];
    NSRange r = [self rangeOfCharacterFromSet:nonAsciiWithoutSpaceCharacterSet];
    return r.location == NSNotFound && self.length > 0;
}


- (NSString *)MD5Hash
{
    const char *data = [self UTF8String];
    if (self.length == 0) {
        return nil;
    }
    CC_LONG len = (CC_LONG)strlen(data);
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data, len, result);
    NSMutableString *ms = @"".mutableCopy;
    for (int i = 0; i < 16; i++) {
        [ms appendFormat:@"%02x",result[i]];
    }
    return ms;
}

+ (NSString *)dateToString:(NSDate *)date atDateFormat:(NSString *)format
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    //使用するカレンダー
    formatter.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
    //NSLocaleのどこかに24時間か12時間を決めるvalueがセットされているみたいなのでen_US_POSIXに変更、これは現在のアメリカの標準ロケートでずっと変わら無いっぽい
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    
    //http://anton0825.hatenablog.com/entry/20130505/1371483153
    formatter.timeZone = [NSTimeZone systemTimeZone];
    
    formatter.dateFormat = format;
    
    return [formatter stringFromDate:date];
}


@end
