//
//  KPCommonUIView.h
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2020/5/29.
//  Copyright © 2020 smithgoo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KPCommonUIView : UIView

@end

@interface KPCommonUIViewPlayError : UIView
@property (nonatomic,copy) void(^errorClickCallback)(void);
@end

NS_ASSUME_NONNULL_END
