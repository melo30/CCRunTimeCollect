一、什么是runtime
1.runtime是一套底层的C语言API（包括了很多强大的C语言数据类型、C语言函数）
2.实际上，平时我们编写的OC代码，底层都是基于runtime实现的
*也就是说，平时我们编写的OC代码，最终都是转成了底层的runtime代码

二、用途

1.能动态产生一个类、变量、方法
2.能动态修改修改一个类、变量、方法
3.能动态删除一个类、变量、方法

三、常见的函数，头文件
1.#import <objc/runtime.h>:成员变量、类、方法
class_copyInvarList:或的某个类内部所有成员变量
class_copyMethodList:或的某个类内部的所有方法
class_getInstanceMethod:获得某个具体的实例方法(对象方法，减号-开头)
class_getClassMethod:获得某个具体的类方法(类方法，加号+开头)
method_exchangeImplementations:交换两个方法的实现

2.#import <objc/message.h>:消息机制
objc_msgSend(...)

