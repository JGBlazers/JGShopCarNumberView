//
//  JGNumberToolView.h
//  JGShopCarNumberView
//
//  Created by FCG on 2017/5/5.
//  Copyright © 2017年 FCG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGNumberToolView;
@protocol JGNumberToolViewDelegate <NSObject>
@optional

/**
 *  开始编辑
 *
 *  @param toolView  工具栏对象
 *  @param textField 工具栏中的输入框
 */
- (void)toolView:(JGNumberToolView *)toolView didEditingWithTextField:(UITextField *)textField;

/**
 *  正在输入
 *
 *  @param toolView  工具栏对象
 *  @param textField 工具栏中的输入框
 */
- (void)toolView:(JGNumberToolView *)toolView didEndEditingWithTextField:(UITextField *)textField;

/**
 *  工具条的数量正在编辑
 *
 *  @param toolView  工具栏对象
 *  @param textField 工具栏中的输入框
 *  @param text      输入框值改变后的结果
 */
- (void)toolView:(JGNumberToolView *)toolView textField:(UITextField *)textField didChangeWithText:(NSString *)text;

/**
 *  工具条的数量达到最大的个数时调用
 *
 *  @param toolView 工具条对象
 *  @param maxNum   最大个数
 */
- (void)toolView:(JGNumberToolView *)toolView inputToMaxNum:(NSInteger)maxNum;

@end

@interface JGNumberToolView : UIView

/**  代理  */
@property (nonatomic, assign) id <JGNumberToolViewDelegate> delegate;

/**  最大的商品数量，也就是库存量 默认 == 1  */
@property (nonatomic, assign) NSInteger maxNumber;

/**  工具View的边框颜色  默认是蓝色  */
@property (nonatomic, strong) UIColor *borderColor;

/**  加减号按钮字体颜色  默认的情况下，和边框的颜色一样  */
@property (nonatomic, strong) UIColor *btnColor;

/**  输入框的字体颜色  默认是黑色  */
@property (nonatomic, strong) UIColor *numTextColor;

/**  输入框的内容(UITextField *textField) 默认 == 1  */
@property (nonatomic, copy) NSString *text;

/**
 *  初始化本类对象
 */
+ (id)shareToolView;
/**
 *  初始化本类对象
 *  @param maxNumber 当前库存量
 */
+ (id)shareToolViewWidthFrame:(CGRect)frame maxNumber:(NSInteger)maxNumber;

/**
 *  输入结束后调用这个方法，让键盘下落
 */
- (void)inputFinish;

@end
