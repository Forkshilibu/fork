//
//  UserManagementViewController.m
//  FolkMusic
//
//  Created by quzg on 4/1/16.
//  Copyright © 2016 quzhenguo. All rights reserved.
//

#import "UserManagementViewController.h"

@interface UserManagementViewController ()

@end

@implementation UserManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    //
    self.title = @"用户管理";
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [leftBtn addTarget:self action:@selector(menuBack:) forControlEvents:UIControlEventTouchUpInside];
    //    [leftBtn setTitle:@"==" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"icon-back"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;    // Do any additional setup after loading the view.
}
- (void)menuBack:(UIButton *)theButton{
    //dis missViewController
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
