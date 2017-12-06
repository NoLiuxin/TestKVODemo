//
//  LabColor.h
//  TestKVODemo
//
//  Created by 刘新 on 2017/12/6.
//  Copyright © 2017年 Liuxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LabColor : NSObject

@property (nonatomic, assign) double lComponent;
@property (nonatomic, assign) double aComponent;
@property (nonatomic, assign) double bComponent;

@property (nonatomic, assign) double redComponent;
@property (nonatomic, assign) double greenComponent;
@property (nonatomic, assign) double blueComponent;

@property (nonatomic, strong) UIColor *color;

@end
