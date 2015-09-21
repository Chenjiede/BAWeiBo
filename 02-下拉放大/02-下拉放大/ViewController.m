//
//  ViewController.m
//  02-下拉放大
//
//  Created by chen on 15/9/21.
//  Copyright © 2015年 chen. All rights reserved.
//

#import "ViewController.h"

const CGFloat BATopViewWid = 350;

@interface ViewController ()

@property (weak, nonatomic) UIImageView *topView;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(BATopViewWid * 0.5, 0, 0, 0);
    
    // 添加图片
    UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"biaoqingdi"]];
    topView.contentMode = UIViewContentModeScaleAspectFill;
    topView.frame = CGRectMake(0, -BATopViewWid, 375, BATopViewWid);
    [self.view insertSubview:topView atIndex:0];
    
    self.topView = topView;
    
}


#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据---%ld", indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat down = -BATopViewWid * 0.5 - scrollView.contentOffset.y;
    if (down < 0) return;
    
    // 改变topView的高度
    CGRect frame = self.topView.frame;
    frame.size.height = BATopViewWid + down;
    self.topView.frame = frame;
}

@end
