//
//  ViewController.m
//  tableViewDemo
//
//  Created by LoveQiuYi on 16/1/22.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

#import "ViewController.h"
#import "CarGroup.h"

@interface ViewController ()

@property (nonatomic,weak) UITableView * tableView;
@property (nonatomic,strong) NSArray * carGroups;
@end

@implementation ViewController
//懒加载
-(NSArray *)carGroups{
    if (!_carGroups) {
        _carGroups = [CarGroup carGroupList];
    }
    return _carGroups;

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.view.backgroundColor = [UIColor redColor];
    self.view = tableView;
    _tableView = tableView;
    //对于有代理以及数据源的对象，第一时间写好这个代码！！！！
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    _carGroups = self.carGroups;
   // NSLog(@"%d",self.carGroups.count);
  
}
/**
 *  以下是tableView的数据源方法，一定要实现
 */
#pragma mark - 表格组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _carGroups.count;
}
#pragma mark - 表格行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CarGroup * groupNum = self.carGroups[section];
    return groupNum.cars.count;
}
#pragma mark - 每个表格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    CarGroup * groupNum = self.carGroups[indexPath.section];
    cell.textLabel.text = groupNum.cars[indexPath.row];
    return cell;
}
/**
 *  以下是代理方法，响应事件
 */
#pragma mark - 点击表格触发的时间
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //选中之后取消表格的选中状态
    [self.tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:YES];
     CarGroup * carGroup = self.carGroups[indexPath.section];
    UIAlertController * alertVc = [UIAlertController alertControllerWithTitle:carGroup.title message:carGroup.cars[indexPath.row] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮响应的事件
        
    }];
    UIAlertAction * otherAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
    }];
    [alertVc addAction:cancleAction];
    [alertVc addAction:otherAction];
    [self presentViewController:alertVc animated:YES completion:nil];
    

}
#pragma mark - 头部
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CarGroup * carGroup = self.carGroups[section];
    return carGroup.title;
}
#pragma mark - 底部
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    CarGroup * carGroup = self.carGroups[section];
    return carGroup.desc;
}
#pragma mark - 标题行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //注意表格默认的高度是44
    return 44;
}
@end
