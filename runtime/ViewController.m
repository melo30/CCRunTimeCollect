//
//  ViewController.m
//  runtime
//
//  Created by 陈诚 on 16/4/5.
//  Copyright © 2016年 陈诚. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "CCPerson.h"
//#import <objc/message.h>
@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *names;
@property (nonatomic, strong) NSArray *books;

@end

@implementation ViewController

- (NSMutableArray *)names
{
    if (_names == nil) {
        _names = [[NSMutableArray alloc]init];
    }
    return _names;
}
- (NSArray *)books
{
    if (_books == nil) {
        _books = [[NSArray alloc]init];
    }
    return _books;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.测试runtime变量属性机制
    [self testIvar];
    
    //2.测试:加入数组nil时，利用分类中的runtime机制，交换方法，看是否报错
    [self addName:@"jack"];
    [self addName:nil];////这里会自动去调用系统的addObject方法，由于利用runtime交换了自己写的方法与系统的方法，这里就去到NSArray+Extentsion中自己写的方法里面
    [self addName:@"rose"];
    [self addName:@"jim"];
    NSLog(@"----%@",self.names);
    
    //3.测试：数组越界时，利用分类中的runtime机制，交换方法，看是否报错
    self.books = @[@"xiaoming",@"xiaohong"];
    NSLog(@"----%@",self.books[4]);//这里会自动去调用系统的objectAtIndex方法，由于利用runtime交换了自己写的方法与系统的方法，这里就去到NSArray+Extentsion中自己写的方法里面
}

- (void)testIvar {
    //Ivar:成员变量
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([CCPerson class], &count);
    for (int i = 0; i < count; i ++) {
        //取得i位置的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"%d %s %s",i,name,type);
    }
}

- (void)addName:(NSString *)name
{
    [self.names addObject:name];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
