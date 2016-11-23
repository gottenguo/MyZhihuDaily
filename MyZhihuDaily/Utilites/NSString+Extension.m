//
//  NSString+Extension.m
//  MyZhihuDaily
//
//  Created by gottenguo on 16/11/2.
//  Copyright © 2016年 郭三涂. All rights reserved.

#import "NSString+Extension.h"

@implementation NSString (Extension)

-(unsigned long long)fileSize{

    unsigned long long size = 0;
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSDictionary *attrs = [mgr attributesOfItemAtPath:self error:nil];
    BOOL isDirectory = [attrs.fileType isEqualToString:NSFileTypeDirectory];
    if(isDirectory){
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
    }else{
        size = attrs.fileSize;
    }
    return size;
}
@end
