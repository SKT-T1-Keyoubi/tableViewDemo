//
//  CarGroup.m
//  tableViewDemo
//
//  Created by LoveQiuYi on 16/1/22.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "CarGroup.h"

@implementation CarGroup

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)carGroupWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

+(NSArray *)carGroupList{
    //加载plist文件
    NSString * path = [[NSBundle mainBundle]pathForResource:@"cars" ofType:@"plist"];
    NSArray * arr = [NSArray arrayWithContentsOfFile:path];
    //字典转模型
    NSMutableArray * tempArray = [NSMutableArray array];
    for (NSDictionary * dic in arr) {
        CarGroup * carGroup = [CarGroup carGroupWithDic:dic];
        [tempArray addObject:carGroup];
    }
    return tempArray;
    
}
@end
