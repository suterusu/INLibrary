//
//  INViewController.m
//  INLibrary
//
//  Created by suterusu2005@gmail.com on 12/24/2017.
//  Copyright (c) 2017 suterusu2005@gmail.com. All rights reserved.
//

#import "INViewController.h"
#import "objc/runtime.h"


@interface INViewController ()

@end

@implementation INViewController

- (void)viewDidLoad
{
    
    
    
    
    NSDictionary *ss = [self properties];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    //format.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierJapanese];
    //format.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];

    

    
    format.dateFormat = @"yyyy";
    NSLog(@"%@",[format stringFromDate:date]);
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSDictionary *)properties {
    unsigned int outCount, i;
    objc_property_t *props = class_copyPropertyList([NSLocale class], &outCount);
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    for(i = 0; i < outCount; i++) {
        objc_property_t property = props[i];
        const char *propName = property_getName(property);
        if(propName) {
            const char *propType = getPropertyType(property);
            NSString *propertyName = [NSString stringWithCString:propName];
            NSString *propertyType = [NSString stringWithCString:propType];
            [dic setObject:propertyType forKey:propertyName];
        }
    }
    free(props);
    
    return dic;
}

- (NSArray *)propertyNames {
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([NSLocale class], &outCount);
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            NSString *propertyName = [NSString stringWithCString:propName];
            [arr addObject:propertyName];
        }
    }
    free(properties);
    
    return arr;
}

static const char * getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T' && attribute[1] != '@') {
            return (const char *)[[NSData dataWithBytes:(attribute + 1) length:strlen(attribute) - 1] bytes];
        }
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2) {
            return "id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@') {
            return (const char *)[[NSData dataWithBytes:(attribute + 3) length:strlen(attribute) - 4] bytes];
        }
    }
    return "";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
