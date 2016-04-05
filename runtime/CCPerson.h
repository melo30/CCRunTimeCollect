//
//  CCPerson.h
//  runtime
//
//  Created by 陈诚 on 16/4/5.
//  Copyright © 2016年 陈诚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCPerson : NSObject<NSCoding>
@property (nonatomic, assign)int age;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *height;

- (void)run;
@end
