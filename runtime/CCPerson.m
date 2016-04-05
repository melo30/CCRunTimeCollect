//
//  CCPerson.m
//  runtime
//
//  Created by 陈诚 on 16/4/5.
//  Copyright © 2016年 陈诚. All rights reserved.
//

#import "CCPerson.h"
#import <objc/runtime.h>
@implementation CCPerson

- (void)run
{
    NSLog(@"---run");
}

//用运行时处理归档，归档所有属性
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    //Ivar:成员变量
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([CCPerson class], &count);
    for (int i = 0; i < count; i ++) {
        //取得i位置的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
}
}
@end
