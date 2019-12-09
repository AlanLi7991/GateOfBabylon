//
//  LinkCallObject.h
//  GateOfBabylon
//
//  Created by Zhuojia on 2019/9/8.
//  Copyright © 2019 Alanli7991. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class GOBLinkCallObject;

//Convenience to call start
#define startAlign start()

typedef GOBLinkCallObject * _Nonnull(^linkFlag)(void);
typedef GOBLinkCallObject * _Nonnull(^linkPrint)(NSString *message);

@interface GOBLinkCallObject : NSObject

- (linkFlag)start;
- (linkPrint)print;
- (linkFlag)end;
+ (NSString *)linkCallSample;

@end

NS_ASSUME_NONNULL_END
