//
//  MainViewController.m
//  FolkMusic
//
//  Created by quzg on 16/3/26.
//  Copyright © 2016年 quzhenguo. All rights reserved.
//

#import "MainViewController.h"
#import "MusicModel.h"
#import "ListCell.h"
#import "PlayMusicViewController.h"
#import "UserManagementViewController.h"
#define cellHeight 180
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *listArray;
    
    
    UITableView *table;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Music天堂";
    
    listArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height) style:UITableViewStylePlain];
    [self.view addSubview:table];
    table.delegate = self;
    table.dataSource = self;
    table.separatorColor = [UIColor clearColor];
    DataDownLoader *download = [[DataDownLoader alloc]init];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"page",@"12",@"count", nil];
    download.delegate = self;
    [download startDownloadDataWithDic:dic];

    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [leftBtn addTarget:self action:@selector(menu:) forControlEvents:UIControlEventTouchUpInside];
//    [leftBtn setTitle:@"==" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"icon-menu"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
- (void)menu:(UIButton *)theButton{
    //Go into UserManagementViewController
    
    UserManagementViewController *vc = [[UserManagementViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
}
- (void)dataSuccess:(DataDownLoader *)theDataLoader dic:(NSDictionary *)theDic{
//    NSLog(@"=====%@",theArray);
    if (theDic != nil) {
        NSArray *recommendListArray = [theDic objectForKey:@"recommendList"];
        if (recommendListArray.count > 0)
        {
            for (NSDictionary *theDic in recommendListArray)
            {
                MusicModel *model = [[MusicModel alloc]initWithDic:theDic];
                [listArray addObject:model];
            }
        }
        [table reloadData];
    }
    
}
#pragma mark - delegate datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  listArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify = @"id";
    ListCell *cell = (ListCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[ListCell alloc]initWithStyle:UITableViewCellStyleDefault cellSize:CGSizeMake(ScreenSize.width, cellHeight) reuseIdentifier:identify];
    }
    cell.model = [listArray objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PlayMusicViewController *vc = [[PlayMusicViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

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
