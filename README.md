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
  pod 'KPengIjkPlayer',:git=>'https://github.com/smithgoo/KPengIjkPlayer.git'

```

## Author

294336370@qq.com

## License

KPengIjkPlayer is available under the MIT license. See the LICENSE file for more info.


How to use

      

- (void)playerBackAction {
    if (!_videoPlayer.isFullScreen) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [_videoPlayer videoPlayrotateAction:NO];
    }
   
}

- (void)exchangeAction:(UIButton*)sender {
    [_videoPlayer exChangePlayMthod];
}


#pragma mark -与全屏相关的代理方法等

- (void)videoScreenFullScreenOrNot:(BOOL)isFullScreen {
    [_videoPlayer videoPlayrotateAction:isFullScreen];
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


	
	
