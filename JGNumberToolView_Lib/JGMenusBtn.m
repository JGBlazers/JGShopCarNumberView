//
//  JGMenusBtn.m
//  JGShopCarNumberView
//
//  Created by FCG on 2017/5/5.
//  Copyright © 2017年 FCG. All rights reserved.
//

#import "JGMenusBtn.h"

@implementation JGMenusBtn

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:30];
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height);
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    if (enabled == YES) {
        [self setTitleColor:self.btnColor forState:UIControlStateNormal];
    } else {
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
}

@end
