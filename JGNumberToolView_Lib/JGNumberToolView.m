//
//  JGNumberToolView.m
//  JGShopCarNumberView
//
//  Created by FCG on 2017/5/5.
//  Copyright © 2017年 FCG. All rights reserved.
//

#import "JGNumberToolView.h"
#import "JGMenusBtn.h"

@interface JGNumberToolView()<UITextFieldDelegate>

/**  加号按钮  */
@property (nonatomic, strong) JGMenusBtn *addBtn;

/**  加号右边分割线  */
@property (nonatomic, strong) UIView *leftLineView;

/**  减号按钮  */
@property (nonatomic, strong) JGMenusBtn *delBtn;

/**  减号右边分割线  */
@property (nonatomic, strong) UIView *rightLineView;

/**  输入框  */
@property (nonatomic, strong) UITextField *numText;

@end

@implementation JGNumberToolView

#pragma - mark      ---------- 初始化调用 ----------
+ (id)shareToolView {
    JGNumberToolView *toolView = [[JGNumberToolView alloc] initWithFrame:CGRectZero];
    return toolView;
}

+ (id)shareToolViewWidthFrame:(CGRect)frame maxNumber:(NSInteger)maxNumber {
    JGNumberToolView *toolView = [[JGNumberToolView alloc] initWithFrame:frame];
    toolView.maxNumber = maxNumber;
    return toolView;
}

#pragma - mark      ---------- 属性重写区 ----------
- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderWidth = 1;
    self.layer.borderColor = _borderColor.CGColor;
    self.layer.masksToBounds = YES;
    
    self.leftLineView.backgroundColor = borderColor;
    self.rightLineView.backgroundColor = borderColor;
}

- (void)setBtnColor:(UIColor *)btnColor {
    _btnColor = btnColor;
    self.addBtn.btnColor = btnColor;
    self.delBtn.btnColor = btnColor;
}

- (void)setNumTextColor:(UIColor *)numTextColor {
    _numTextColor = numTextColor;
    self.numText.textColor = _numTextColor;
}

- (void)setMaxNumber:(NSInteger)maxNumber {
    maxNumber = maxNumber < 1 ? 1 : maxNumber;
    _maxNumber = maxNumber;
    
    self.addBtn.enabled = self.maxNumber > 1;
}

#pragma - mark      ---------- 初始化构造方法 ----------
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _borderColor = [UIColor blueColor];
        _numTextColor = [UIColor blackColor];
        
        _maxNumber = self.maxNumber == 0 ? 1 : self.maxNumber;
        _text = @"1";
        
        // 创建本类UI
        [self createSelfUI];
        
        self.btnColor = _borderColor;
    }
    return self;
}

#pragma - mark      ---------- 创建本类UI ----------
- (void)createSelfUI {
    
    // 设置边框
    self.layer.borderWidth = 1;
    self.layer.borderColor = _borderColor.CGColor;
    self.layer.masksToBounds = YES;
    
    /**  加号按钮  */
    JGMenusBtn *addBtn = [JGMenusBtn buttonWithType:UIButtonTypeCustom];
    addBtn.enabled = self.maxNumber > 1;
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addBtn];
    self.addBtn = addBtn;
    
    /**  加号右边分割线  */
    UIView *leftLineView = [UIView new];
    leftLineView.backgroundColor = _borderColor;
    [self addSubview:leftLineView];
    self.leftLineView = leftLineView;
    
    /**  减号按钮  */
    JGMenusBtn *delBtn = [JGMenusBtn buttonWithType:UIButtonTypeCustom];
    [delBtn setTitle:@"-" forState:UIControlStateNormal];
    delBtn.enabled = NO;
    [delBtn addTarget:self action:@selector(delBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:delBtn];
    self.delBtn = delBtn;
    
    /**  减号右边分割线  */
    UIView *rightLineView = [UIView new];
    rightLineView.backgroundColor = _borderColor;
    [self addSubview:rightLineView];
    self.rightLineView = rightLineView;
    
    /**  输入框  */
    UITextField *numText = [[UITextField alloc] init];
    numText.delegate = self;
    numText.keyboardType = UIKeyboardTypeNumberPad;
    numText.textAlignment = NSTextAlignmentCenter;
    numText.text = self.text;
    numText.font = [UIFont systemFontOfSize:20];
    [numText addTarget:self action:@selector(textFieldContentToChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:numText];
    self.numText = numText;
}

/**
 *  排列
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat btnWH = self.frame.size.height;
    CGFloat textW = self.frame.size.width - 2 * btnWH;
    
    self.addBtn.frame = CGRectMake(0, 0, btnWH - 1, btnWH);
    
    self.leftLineView.frame = CGRectMake(CGRectGetMaxX(self.addBtn.frame), 0, 1, btnWH);
    
    self.delBtn.frame = CGRectMake(self.frame.size.width - btnWH - 1, 0, btnWH - 1, btnWH);
    
    self.rightLineView.frame = CGRectMake(CGRectGetMinX(self.delBtn.frame), 0, 1, btnWH);
    
    self.numText.frame = CGRectMake(CGRectGetMaxX(self.leftLineView.frame), 0, textW, btnWH);
}

#pragma - mark      ---------- UITextField Delegate ----------
/**
 *  开始编辑
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(toolView:didEditingWithTextField:)]) {
        [self.delegate toolView:self didEditingWithTextField:textField];
    }
}

/**
 *  结束编辑
 */
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.text.integerValue < 1) {
        textField.text = @"1";
        self.text = @"1";
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(toolView:didEndEditingWithTextField:)]) {
        [self.delegate toolView:self didEndEditingWithTextField:textField];
    }
}

/**
 *  正在编辑
 */
- (void)textFieldContentToChange:(UITextField *)textField {
    
    self.addBtn.enabled = self.maxNumber > 1;
    if (textField.text.integerValue >= self.maxNumber) {
        self.addBtn.enabled = NO;
        textField.text = [NSString stringWithFormat:@"%zd", self.maxNumber];
    }
    
    self.delBtn.enabled = textField.text.integerValue > 1;
    
    self.text = [NSString stringWithFormat:@"%zd", textField.text.integerValue];
    if (self.delegate && [self.delegate respondsToSelector:@selector(toolView:textField:didChangeWithText:)]) {
        [self.delegate toolView:self textField:textField didChangeWithText:textField.text];
    }
}

#pragma - mark      ---------- 本类事件 ----------
/**
 *  加号按钮的点击
 */
- (void)addBtnClick {
    
    NSInteger count = self.text.integerValue;
    count ++;
    
    self.addBtn.enabled = !(count == self.maxNumber);
    
    self.delBtn.enabled = count > 1;
    
    self.numText.text = [NSString stringWithFormat:@"%zd", (self.numText.text.integerValue + 1)];
    self.text = self.numText.text;
}

/**
 *  减号按钮的点击
 */
- (void)delBtnClick {
    
    NSInteger count = self.text.integerValue;
    
    count --;
    
    self.delBtn.enabled = !(count == 1);
    
    self.addBtn.enabled = count <= self.maxNumber;
    
    self.numText.text = [NSString stringWithFormat:@"%zd", count];
    self.text = self.numText.text;
}

/**
 *  输入完成
 */
- (void)inputFinish {
    [_numText resignFirstResponder];
}

@end
