//
//  LinkCallObject.m
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/9/8.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

#import "GOBLinkCallObject.h"


@interface GOBLinkCallObject ()

@property (nonatomic, strong) NSMutableString *string;

@end

@implementation GOBLinkCallObject

- (instancetype)init {
    self = [super init];
    if (self) {
        _string = [NSMutableString string];
    }
    return self;
}

- (linkFlag)start {
    return ^GOBLinkCallObject *(void) {
        [self.string appendString:@"[ "];
        return self;
    };
}

- (linkPrint)print {
    return  ^GOBLinkCallObject *(NSString *message) {
        [self.string appendString:[NSString stringWithFormat:@"%@, ", message]];
        return self;
    };
}

- (linkFlag)end {
    return ^GOBLinkCallObject *(void) {
        [self.string deleteCharactersInRange:NSMakeRange(self.string.length-2, 2)];
        [self.string appendString:@" ]"];
        return self;
    };
}


+ (NSString *)linkCallSample {
    GOBLinkCallObject *obj = [[GOBLinkCallObject alloc] init];
    //1. Call start use align
    //2. Call print
    //3. Call end use normal
    obj.startAlign.print(@"first").print(@"second").print(@"third").end();
    return obj.string;
}

@end
