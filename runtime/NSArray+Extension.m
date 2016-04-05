//
//  NSArray+Extension.m
//  runtime
//
//  Created by 陈诚 on 16/4/6.
//  Copyright © 2016年 陈诚. All rights reserved.
//

#import "NSArray+Extension.h"
#import <objc/runtime.h>

@implementation NSArray (Extension)

//此方法当类的.m问价加载到内存中时会自动调用，不用管。
+ (void)load
{
    Method otherMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(cc_objectAtIndex:));
    Method originMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
    
    //交换两个方法的实现
    method_exchangeImplementations(otherMethod, originMethod);
}

- (id)cc_objectAtIndex:(NSInteger)index//ViewCtr来到这块调用系统的方法，实际不是了，被交换了
{
    if (index < self.count) {
        return [self cc_objectAtIndex:index];//这里真正的系统的方法，查询数组的index
    }else
    {
        return nil;
    }
}
@end
