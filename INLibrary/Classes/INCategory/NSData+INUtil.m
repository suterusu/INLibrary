//
//  NSData+INUtil.m
//  Pods
//
//  Created by Inba on 2017/12/25.
//
//

#import "NSData+INUtil.h"
#import <zlib.h>

@implementation NSData (INUtil)

//https://qiita.com/odaman68000/items/d33096abfa1d9e8f6aca
- (z_stream)initialized_zStream {
    z_stream zStream;
    zStream.zalloc = Z_NULL;
    zStream.zfree = Z_NULL;
    zStream.opaque = Z_NULL;
    return zStream;
}

- (id)deflate:(int)compressionLevel {
    z_stream zStream = [self initialized_zStream];
    Bytef buffer[131072];
    deflateInit(&zStream, compressionLevel);
    zStream.next_in = (Bytef *)self.bytes;
    zStream.avail_in = (unsigned int)self.length;
    int retval = Z_OK;
    NSMutableData *ret = [NSMutableData dataWithCapacity:0];
    do {
        zStream.next_out = buffer;
        zStream.avail_out = sizeof(buffer);
        retval = deflate(&zStream, Z_FINISH);
        size_t length = sizeof(buffer) - zStream.avail_out;
        if (length > 0)
            [ret appendBytes:buffer length:length];
    } while (zStream.avail_out != sizeof(buffer));
    deflateEnd(&zStream);
    return ret;
}

- (id)inflate {
    z_stream zStream = [self initialized_zStream];
    Bytef buffer[131072];
    inflateInit(&zStream);
    zStream.next_in = (Bytef *)self.bytes;
    zStream.avail_in = (unsigned int)self.length;
    int retval = Z_OK;
    NSMutableData *ret = [NSMutableData dataWithCapacity:0];
    do {
        zStream.next_out = buffer;
        zStream.avail_out = sizeof(buffer);
        retval = inflate(&zStream, Z_FINISH);
        size_t length = sizeof(buffer) - zStream.avail_out;
        if (length > 0)
            [ret appendBytes:buffer length:length];
    } while (zStream.avail_out != sizeof(buffer));
    inflateEnd(&zStream);
    return ret;
}

@end
