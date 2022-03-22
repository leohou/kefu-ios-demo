//
//  HDItemVIew.m
//  CustomerSystem-ios
//
//  Created by houli on 2022/3/21.
//  Copyright © 2022 easemob. All rights reserved.
//

#import "HDItemView.h"
#import "UIImage+HDIconFont.h"
@implementation HDItemView

- (instancetype)initWithFrame:(CGRect)frame{
    
   
    self = [super initWithFrame:frame];
    if (self) {
       
        //创建ui
        [self _creatUI];
    }
    return self;
}
- (void)_creatUI{
    
    [self addSubview: self.muteBtn];
    [self addSubview: self.nickNameBtn];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    [self.nickNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
    }];
    [self.muteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(self.nickNameBtn.mas_centerY);
        make.trailing.mas_equalTo(self.nickNameBtn.mas_leading).offset(0);
        make.height.offset(32);
        make.width.offset(32);
        
    }];
    
}

- (UIButton *)muteBtn{
    if (!_muteBtn) {
        _muteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //为button赋值
//        [_muteBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        UIImage *img  = [UIImage imageWithIcon:kmaikefeng5 inFont:kfontName size:22 color:[UIColor colorWithRed:12.0/255.0 green:110.0/255.0 blue:254.0/255.0 alpha:1.000] ] ;
        [_muteBtn setImage:img forState:UIControlStateNormal];
//        [_muteBtn setImage:[UIImage imageNamed:@"audioMuted"] forState:UIControlStateSelected];
        
       
    }
    return _muteBtn;
}
- (UIButton *)nickNameBtn{
    if (!_nickNameBtn) {
        _nickNameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //为button赋值
        _nickNameBtn.backgroundColor = [UIColor lightGrayColor];
        _nickNameBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
        _nickNameBtn.titleLabel.numberOfLines = 0;
        _nickNameBtn.layer.cornerRadius = 14;
        _nickNameBtn.layer.masksToBounds = YES;
        _nickNameBtn.alpha = 0.8;
        _nickNameBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _nickNameBtn;
}


- (void)setItemString:(NSString *)str{
    
    [self.nickNameBtn setTitle:str forState:UIControlStateNormal];
    CGFloat with = [self setTextWidth:str];
    [self.nickNameBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
        make.width.offset(with);
    }];
}


- (CGFloat )setTextWidth:(NSString *)str
{
    CGFloat size = [str boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.nickNameBtn.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:NULL].size.width;
    
    return size + 10;
    
}
@end
