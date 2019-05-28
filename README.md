# KPengIjkPlayer

[![CI Status](https://img.shields.io/travis/294336370@qq.com/KPengIjkPlayer.svg?style=flat)](https://travis-ci.org/294336370@qq.com/KPengIjkPlayer)
[![Version](https://img.shields.io/cocoapods/v/KPengIjkPlayer.svg?style=flat)](https://cocoapods.org/pods/KPengIjkPlayer)
[![License](https://img.shields.io/cocoapods/l/KPengIjkPlayer.svg?style=flat)](https://cocoapods.org/pods/KPengIjkPlayer)
[![Platform](https://img.shields.io/cocoapods/p/KPengIjkPlayer.svg?style=flat)](https://cocoapods.org/pods/KPengIjkPlayer)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

KPengIjkPlayer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KPengIjkPlayer'
```

## Author

294336370@qq.com, 295336370@qq.com

## License

KPengIjkPlayer is available under the MIT license. See the LICENSE file for more info.


How to use

      
      #pragma mark -- ijk 封装完成之后在 控制器要实现的代理方法 begin  当然可以再简化
- (void)KPVideoPlayerDistory {
    [_videoPlayer.player stop];
    [_videoPlayer.player shutdown];
    [_videoPlayer.player.view removeFromSuperview];
    _videoPlayer = nil;
 
}

- (void)playerBackAction {
    if (!_videoPlayer.isFullScreen) {
        [_videoPlayer.player stop];
        [_videoPlayer.player shutdown];
        [_videoPlayer.player.view removeFromSuperview];
        _videoPlayer = nil;
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            NSNumber * value  = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        }];
    }
    
}

- (void)exchangeAction:(UIButton*)sender {
    [_videoPlayer exChangePlayMthod];
}


- (void)videoScreenFullScreenOrNot:(BOOL)isFullScreen {
    if (isFullScreen) {//小屏->全屏
        [UIView animateWithDuration:0.25 animations:^{
            NSNumber * value  = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        }];
    }else{//全屏->小屏
        [UIView animateWithDuration:0.25 animations:^{
            NSNumber * value  = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        }];
    }
    _videoPlayer.isFullScreen =isFullScreen;
    _videoPlayer.toolsView.isFullScreen =isFullScreen;
    
}


#pragma mark -与全屏相关的代理方法等

BOOL fullScreen;

static UIButton * btnFullScreen;

//点击了全屏按钮
-(void)btnFullScreenDidClick:(UIButton *)sender{
    
    fullScreen = !fullScreen;
    
    btnFullScreen = sender;
    
    if (fullScreen) {//小屏->全屏
        [UIView animateWithDuration:0.25 animations:^{
            NSNumber * value  = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        }];
        
        
    }else{//全屏->小屏
        [UIView animateWithDuration:0.25 animations:^{
            NSNumber * value  = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
            [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
            
        }];
        
    }
    [_videoPlayer.toolsView layoutSubviews];
}

#pragma mark------ijk 播放的代理方法
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    if ([UIDevice currentDevice].orientation ==UIDeviceOrientationLandscapeLeft||[UIDevice currentDevice].orientation ==UIDeviceOrientationLandscapeRight){
        UIWindow*window= [UIApplication sharedApplication].keyWindow;
        _videoPlayer.frame=CGRectMake(0, 0, size.width,size.height);
        _videoPlayer.player.view.frame=CGRectMake(0, 0, size.width,size.height);
        _videoPlayer.isFullScreen=YES;
        _videoPlayer.toolsView.isFullScreen =YES;
        [window addSubview:_videoPlayer];
        
    }else{
        //        if (KIsiPhoneX||KIsiPhoneXR||KIsiPhoneXS||KIsiPhoneXS_MAX) {
        //            _playerView.frame=CGRectMake(0, 30, size.width, size.width/16*9);
        //            _playerView.player.view.frame=CGRectMake(0, 30, size.width, size.width/16*9);
        //        } else {
        _videoPlayer.frame=CGRectMake(0, 0, size.width, size.width/16*9);
        _videoPlayer.player.view.frame=CGRectMake(0, 0, size.width, size.width/16*9);
        //        }
        _videoPlayer.isFullScreen=NO;
        _videoPlayer.toolsView.isFullScreen =NO;
        [self.view addSubview:_videoPlayer];
        
    }
    
}

#pragma mark -- ijk 封装完成之后在 控制器要实现的代理方法 end
