//
//  ViewController.m
//  JGShopCarNumberView
//
//  Created by FCG on 2017/5/5.
//  Copyright © 2017年 FCG. All rights reserved.
//

#import "ViewController.h"
#import "JGNumberToolView.h"

@interface ViewController ()<JGNumberToolViewDelegate>

/**  数量工具栏  */
@property (nonatomic, strong) JGNumberToolView *toolView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    JGNumberToolView *toolView = [JGNumberToolView shareToolView];
    toolView.frame = CGRectMake(self.view.frame.size.width / 2 - 100, 200, 200, 40);
    // 设置库存量  不设置默认为1
    toolView.maxNumber = 10;
    toolView.delegate = self;
    [self.view addSubview:toolView];
    
    self.toolView = toolView;
}

#pragma - mark      ---------- JGNumberToolViewDelegate ----------
/**
 *  开始编辑
 *
 *  @param toolView  工具栏对象
 *  @param textField 工具栏中的输入框
 */
- (void)toolView:(JGNumberToolView *)toolView didEditingWithTextField:(UITextField *)textField {
    NSLog(@"class == %@  line == %zd  func == %s", [self class], __LINE__, __FUNCTION__);
}

/**
 *  正在输入
 *
 *  @param toolView  工具栏对象
 *  @param textField 工具栏中的输入框
 */
- (void)toolView:(JGNumberToolView *)toolView didEndEditingWithTextField:(UITextField *)textField {
    NSLog(@"class == %@  line == %zd  func == %s", [self class], __LINE__, __FUNCTION__);
}

/**
 *  工具条的数量正在编辑
 *
 *  @param toolView  工具栏对象
 *  @param textField 工具栏中的输入框
 *  @param text      输入框值改变后的结果
 */
- (void)toolView:(JGNumberToolView *)toolView textField:(UITextField *)textField didChangeWithText:(NSString *)text{
    // 拿到加减后的输入框的内容方式一：
    NSLog(@"  text == %@", text);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    // 拿到加减后的输入框的内容方式二：
    NSLog(@"%@", self.toolView.text);
    
    [self.view endEditing:YES];
}



@end
