//
//  KPCommonUIView.m
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2020/5/29.
//  Copyright © 2020 smithgoo. All rights reserved.
//

#import "KPCommonUIView.h"
#import "UIView+size.h"
@implementation KPCommonUIView

@end

@interface KPCommonUIViewPlayError ()
@property (nonatomic,strong) UILabel *errorLab;
@property (nonatomic,strong) UIButton *errorbtn;
@end
@implementation KPCommonUIViewPlayError : UIView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setupUI:frame];
    return self;
}

- (void)setupUI:(CGRect)frame {
    self.backgroundColor =[UIColor blackColor];
    self.errorLab =[UILabel new];
    [self addSubview:self.errorLab];
    self.errorLab.frame = CGRectMake(10, self.centerY-70, self.width-20, 21);
    self.errorLab.textAlignment = NSTextAlignmentCenter;
    self.errorLab.font =[UIFont systemFontOfSize:14];
    self.errorLab.textColor =[UIColor whiteColor];
    self.errorLab.text = @"视频源播放出现错误";
    
    self.errorbtn =[UIButton new];
    [self addSubview:self.errorbtn];
    self.errorbtn.frame = CGRectMake((self.width-100)/2, self.errorLab.bottom+10, 100, 30);
    [self.errorbtn setTitle:@"点击重试" forState:UIControlStateNormal];
    [self.errorbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.errorbtn.layer.cornerRadius =2;
    self.errorbtn.layer.borderColor =[UIColor whiteColor].CGColor;
    self.errorbtn.layer.borderWidth =1;
    [self.errorbtn addTarget:self action:@selector(retryAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)retryAction:(UIButton*)sender {
    if (self.errorClickCallback) {
        self.errorClickCallback();
    }
}



@end
