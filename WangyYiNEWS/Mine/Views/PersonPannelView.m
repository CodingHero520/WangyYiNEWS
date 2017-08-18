//
//  PersonPannelView.m
//  WangyYiNEWS
//
//  Created by 包磊 on 17/8/18.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "PersonPannelView.h"
#import "maskButton.h"
#import "Masonry.h"

#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define BUTTONWIDTH KWIDTH/3
@interface PersonPannelView ()

@property (nonatomic ,strong)maskButton * saveButton;
@property (nonatomic ,strong)maskButton * historyButton;
@property (nonatomic ,strong)maskButton * tieButton;
@end
@implementation PersonPannelView

-(instancetype)initWithFrame:(CGRect)frame{

   self = [super initWithFrame:frame];

    if (self) {
        
        [self addSubview:self.saveButton];
        [self addSubview:self.historyButton];
        [self addSubview:self.tieButton];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
    
}
-(maskButton *)saveButton
{

    if (!_saveButton) {
        
        _saveButton = [[maskButton alloc] init];
        
        _saveButton.buttonTitle = @"收藏";
        
    }
    return _saveButton;

}

-(maskButton *)historyButton{

    if (!_historyButton) {
        
        _historyButton = [[maskButton alloc] init];
        
        _historyButton.buttonTitle = @"历史";
    }
    
    return _historyButton;

}
-(maskButton *)tieButton{

    if (!_tieButton) {
        
        _tieButton = [[maskButton alloc] init];
        
        _tieButton.buttonTitle = @"跟贴";
    }
    
    return _tieButton;

}
-(void)layoutSubviews{

    [super layoutSubviews];

    [_saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.mas_bottom);
        
        make.left.mas_equalTo(self.mas_left);
        
        make.size.mas_equalTo(CGSizeMake(BUTTONWIDTH, 55));
        
    }];
    
    [_historyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.mas_bottom);
        
        make.centerX.mas_equalTo(self.mas_centerX);
        
        make.size.mas_equalTo(CGSizeMake(BUTTONWIDTH, 55));
    }];

    
    [_tieButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.mas_bottom);
        
        make.left.mas_equalTo(self.historyButton.mas_right);
        
        make.size.mas_equalTo(CGSizeMake(BUTTONWIDTH, 55));
        
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
