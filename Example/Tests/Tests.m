//
//  INLibraryTests.m
//  INLibraryTests
//
//  Created by suterusu2005@gmail.com on 12/24/2017.
//  Copyright (c) 2017 suterusu2005@gmail.com. All rights reserved.
//

#import <INLibrary/NSString+INUtil.h>

@import XCTest;
//XCTAssertTrue( == 1,@"");

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    


    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}


-(void)testNSStringTest{
    
    XCTAssertTrue([@"" lineNumber] == 1);
    XCTAssertTrue([@"aaaa" lineNumber] == 1);
    XCTAssertTrue([@"\n" lineNumber] == 2);
    XCTAssertTrue([@"\na\naa\n" lineNumber] == 4);
    XCTAssertTrue([@"aaaa\n" lineNumber] == 2);
    XCTAssertTrue([@"\naaaa" lineNumber] == 2);
    XCTAssertTrue([@"\nanaa\n" lineNumber] == 3);
    XCTAssertTrue([@"aa\naa\naa" lineNumber] == 3);

    
    XCTAssertTrue([@"aaaaa" isConsitOfOnlyDigit] == NO);
    XCTAssertTrue([@"123345" isConsitOfOnlyDigit] == YES);
    XCTAssertTrue([@"122adk3" isConsitOfOnlyDigit] == NO);
    XCTAssertTrue([@"ああかか" isConsitOfOnlyDigit] == NO);
    XCTAssertTrue([@"aa\naaa" isConsitOfOnlyDigit] == NO);
    XCTAssertTrue([@"aaaaa" isConsitOfOnlyASCII] == YES);
    XCTAssertTrue([@"123345" isConsitOfOnlyASCII] == YES);
    XCTAssertTrue([@"122adk3" isConsitOfOnlyASCII] == YES);
    XCTAssertTrue([@"ああかか" isConsitOfOnlyASCII] == NO);
    XCTAssertTrue([@"aa\naaa" isConsitOfOnlyASCII] == NO);
    XCTAssertTrue([[@"テストテスト" MD5Hash] isEqualToString:@"22681e15fb363104698fd9c17651c5bf"] == 1,@"%@",[@"テストテスト" MD5Hash]);


    
    
    
}


- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end

