//
//  MusicModel.m
//  FolkMusic
//
//  Created by quzg on 16/3/30.
//  Copyright © 2016年 quzhenguo. All rights reserved.
//

#import "MusicModel.h"

@implementation MusicModel
- (id)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        
//        @property (nonatomic,strong)NSString *composer;
//        @property (nonatomic,strong)NSString *createdAt;
//        @property (nonatomic,strong)NSString *lrc;
//        @property (nonatomic,strong)NSString *lyrics;
//        @property (nonatomic,strong)NSString *music;
//        @property (nonatomic,strong)NSString *objectId;
//        @property (nonatomic,strong)NSString *poster;
//        @property (nonatomic,strong)NSString *singer;
//        @property (nonatomic,strong)NSString *title;
//        @property (nonatomic,strong)NSString *updatedAt;
        self.composer = [NSString stringWithFormat:@"%@",[dic objectForKey:@"composer"]];
        self.createdAt = [NSString stringWithFormat:@"%@",[dic objectForKey:@"createdAt"]];
        self.lrc = [NSString stringWithFormat:@"%@",[dic objectForKey:@"lrc"]];
        self.lyrics = [NSString stringWithFormat:@"%@",[dic objectForKey:@"lyrics"]];
        self.music = [NSString stringWithFormat:@"%@",[dic objectForKey:@"music"]];
        
        self.objectId = [NSString stringWithFormat:@"%@",[dic objectForKey:@"objectId"]];
        self.poster = [NSString stringWithFormat:@"%@",[dic objectForKey:@"poster"]];
        self.singer = [NSString stringWithFormat:@"%@",[dic objectForKey:@"singer"]];
        self.title = [NSString stringWithFormat:@"%@",[dic objectForKey:@"title"]];
        self.updatedAt = [NSString stringWithFormat:@"%@",[dic objectForKey:@"updatedAt"]];
 
    }
    return self;
}

//@property (nonatomic,strong)NSString *createtime;
//@property (nonatomic,strong)NSString *endtime;
//@property (nonatomic,strong)NSString *topId;
//@property (nonatomic,strong)NSString *topPic;
//@property (nonatomic,strong)NSString *topSkip;
//@property (nonatomic,strong)NSString *topTitle;
//@property (nonatomic,strong)NSString *topType;
@end
