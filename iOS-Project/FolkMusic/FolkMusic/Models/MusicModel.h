//
//  MusicModel.h
//  FolkMusic
//
//  Created by quzg on 16/3/30.
//  Copyright © 2016年 quzhenguo. All rights reserved.
//

#import "RootModel.h"

@interface MusicModel : RootModel
- (id)initWithDic:(NSDictionary *)dic;
@property (nonatomic,strong)NSString *composer;
@property (nonatomic,strong)NSString *createdAt;
@property (nonatomic,strong)NSString *lrc;
@property (nonatomic,strong)NSString *lyrics;
@property (nonatomic,strong)NSString *music;
@property (nonatomic,strong)NSString *objectId;
@property (nonatomic,strong)NSString *poster;
@property (nonatomic,strong)NSString *singer;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *updatedAt;

@end
