//
//  NSMutableArray+Extension.m
//  runtime
//
//  Created by 陈诚 on 16/4/5.
//  Copyright © 2016年 陈诚. All rights reserved.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>
@implementation NSMutableArray (Extension)

//此方法当类的.m问价加载到内存中时会自动调用，不用管。
+ (void)load
{
    Method otherMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(cc_addObject:));
    Method originMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
    //交换两个方法的实现
    method_exchangeImplementations(otherMethod, originMethod);
}

- (void)cc_addObject:(id)object//ViewCtr来到这块调用系统的方法，实际不是了，被交换了
{
    if (object != nil) {
        [self cc_addObject:object];//这里真正的系统的方法，加入数组
    }
}
@end
