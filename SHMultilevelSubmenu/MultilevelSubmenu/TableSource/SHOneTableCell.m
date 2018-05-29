//
//  SHOneTableCell.m
//  SHMultilevelSubmenu
//
//  Created by HaoSun on 2018/5/28.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHOneTableCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
@interface SHOneTableCell ()
@property (nonatomic, weak) UILabel *label1;

@property (nonatomic, weak) UIImageView *imageView1;
@end

@implementation SHOneTableCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {

    NSString *ID = NSStringFromClass([SHOneTableCell class]);

    SHOneTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SHOneTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setAccessoryType:UITableViewCellAccessoryNone];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setupSubViews];
        [self setupLayout];

    }
    return self;
}

#pragma mark - UISetup
- (void)setupSubViews {

    UILabel *label1 = [[UILabel alloc] init];
    label1.font = [UIFont systemFontOfSize:13.0f];
    label1.textColor = [UIColor redColor];
    _label1 = label1;
    [self.contentView addSubview:_label1];

    UIImageView *imageView1 = [[UIImageView alloc] init];
    _imageView1 = imageView1;
    [self.contentView addSubview:_imageView1];

}

#pragma mark - Layout
- (void)setupLayout {

    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20.0f);
        make.top.bottom.mas_equalTo(self.contentView);
        make.height.mas_equalTo(60.0f);
        make.width.height.mas_equalTo(60.0f);
    }];

    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageView1.mas_right);
        make.top.bottom.mas_equalTo(self.contentView);
    }];



}

- (void)setOneModel:(SHOneModel *)oneModel {
    _oneModel = oneModel;
    _label1.text = _oneModel.title;
    [_imageView1 sd_setImageWithURL:(NSURL *)_oneModel.imageN placeholderImage:[UIImage imageNamed:@"WX201"]];
}

@end
