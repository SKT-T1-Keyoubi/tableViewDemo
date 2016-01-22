//
//  CarGroup.h
//  tableViewDemo
//
//  Created by LoveQiuYi on 16/1/22.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroup : NSObject
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * desc;
@property (nonatomic,strong) NSArray * cars;
-(instancetype) initWithDic:(NSDictionary *) dic;
+(instancetype) carGroupWithDic:(NSDictionary *) dic;
+(NSArray *)carGroupList;
@end
