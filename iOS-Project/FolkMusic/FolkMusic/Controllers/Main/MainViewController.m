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
    listArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height) style:UITableViewStylePlain];
    [self.view addSubview:table];
    table.delegate = self;
    table.dataSource = self;
    
    
    
    
    
    
    
    DataDownLoader *download = [[DataDownLoader alloc]init];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"page",@"12",@"count", nil];
    download.delegate = self;
    [download startDownloadDataWithDic:dic];
    // Do any additional setup after loading the view.
}
-(void)dataSuccess:(DataDownLoader *)theDataLoader withArray:(NSArray *)theArray{
    NSLog(@"=====%@",theArray);
    if (theArray.count > 0) {
        for (NSDictionary *dic in theArray) {
            MusicModel *model = [[MusicModel alloc]initWithDic:dic];
            [listArray addObject:model];
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
//    cell.theTextLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    _headLabel.text = [_dataArray objectAtIndex:indexPath.row];
//    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.4];
//    
//    
//    self.frame = CGRectMake(theFrame.origin.x, theFrame.origin.y, theFrame.size.width  , headHeight);
//    self.tableV.frame = CGRectMake(0, headHeight, tableViewWidth, 0);
//    selected = NO;
//    _arrowImageView.transform = CGAffineTransformRotate(_arrowImageView.transform, DEGREES_TO_RADIANS(180));
//    
//    [UIView commitAnimations];
//    
//    
//    [self.delegate selectAtIndex:indexPath.row inListTableView:self];
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
