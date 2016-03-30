//
//  ListCell.h
//  UParking
//
//  Created by CheWei on 15/11/18.
//  Copyright © 2015年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MusicModel;
@interface ListCell : UITableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style  cellSize:(CGSize)theCellSize reuseIdentifier:(NSString *)reuseIdentifier;
@property (nonatomic,strong)UIImageView * theImageV;
@property (nonatomic,strong)UILabel     * theTextLabel;

@property (nonatomic,assign)int style;
@property (nonatomic,strong)MusicModel *model;
@end
