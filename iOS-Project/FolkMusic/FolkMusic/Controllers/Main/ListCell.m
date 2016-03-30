//
//  ListCell.m
//  UParking
//
//  Created by CheWei on 15/11/18.
//  Copyright © 2015年 yu. All rights reserved.
//

#import "ListCell.h"
#import "MusicModel.h"
#import "UIImageView+AFNetworking.h"
@implementation ListCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style  cellSize:(CGSize)theCellSize reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.theImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,theCellSize.width, theCellSize.height)];
        self.theImageV.backgroundColor = [UIColor purpleColor];
//        _theImageV.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_theImageV];
        
        
        self.theTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, theCellSize.height/3.0 *2.0, theCellSize.width, theCellSize.height/3.0)];
        _theTextLabel.textAlignment = NSTextAlignmentCenter;
        _theTextLabel.font = BoldFONT(18);
        _theTextLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_theTextLabel];
        
      
      
//        UIView *line  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, theCellSize.width, 0.3)];
//        line.backgroundColor = [UIColor grayColor];
//        [self.contentView addSubview:line];
    }
    return self;
}
- (void)layoutSubviews{
    [_theImageV setImageWithURL:[NSURL URLWithString: self.model.poster]];
    _theTextLabel.text = [NSString stringWithFormat:@"%@|歌者:%@|作曲:%@",_model.title,_model.singer,_model.lyrics];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
