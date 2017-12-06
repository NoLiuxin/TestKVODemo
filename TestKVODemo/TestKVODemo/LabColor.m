//
//  LabColor.m
//  TestKVODemo
//
//  Created by 刘新 on 2017/12/6.
//  Copyright © 2017年 Liuxin. All rights reserved.
//

#import "LabColor.h"

@implementation LabColor
- (id)init
{
    self = [super init];
    if (self) {
        self.redComponent = [self getRandomNumber:0 to:255];
        self.greenComponent = [self getRandomNumber:0 to:255];
        self.blueComponent = [self getRandomNumber:0 to:255];
    }
    return self;
}
//redComponent属性依赖于lComponent属性，如果lComponent改变redComponent属性也随之更改
+ (NSSet *)keyPathsForValuesAffectingRedComponent
{
    return [NSSet setWithObject:@"lComponent"];
}
- (double)redComponent;
{
    return self.lComponent*255.0;
}
//greenComponent属性依赖于lComponent属性和aComponent属性，如果lComponent属性和aComponent属性改变greenComponent属性也随之更改
+ (NSSet *)keyPathsForValuesAffectingGreenComponent
{
    return [NSSet setWithObjects:@"lComponent", @"aComponent", nil];
}
- (double)greenComponent
{
    return self.lComponent*self.aComponent*255.0;
}
//blueComponent属性依赖于lComponent属性和bComponent属性，如果lComponent属性和bComponent属性改变blueComponent属性也随之更改
+ (NSSet *)keyPathsForValuesAffectingBlueComponent
{
    return [NSSet setWithObjects:@"lComponent", @"bComponent", nil];
}
- (double)blueComponent
{
    return self.lComponent*self.bComponent*255.0;
}
//color属性依赖于redComponent属性和greenComponent属性和blueComponent属性，如果redComponent属性和greenComponent属性和blueComponent属性改变color属性也随之更改
+ (NSSet *)keyPathsForValuesAffectingColor
{
    return [NSSet setWithObjects:@"redComponent", @"greenComponent", @"blueComponent", nil];
}

- (UIColor *)color
{
    return [UIColor colorWithRed:self.redComponent/255.0 green:self.greenComponent/255.0 blue:self.blueComponent/255.0 alpha:1.];
}
- (int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}
@end
