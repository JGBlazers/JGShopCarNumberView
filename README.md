# JGShopCarNumberView
## 将京东商品添加购物车时的数量加减控制工具条

![(预览)](http://a3.qpic.cn/psb?/V12Jfkjf2iD8LO/339MqPUuWGs2FAW75nS1V.pBrbvTF.klvJNZGxKond4!/b/dGoBAAAAAAAA&bo=gALAAwAAAAACtdA!&rf=viewer_4)

## 一、简介
#### 将京东商品添加购物车时的数量加减控制工具条

## 二、基本使用
## <a id="ViewController.h"></a>ViewController.h
```objc
// 初始化
JGNumberToolView *toolView = [JGNumberToolView shareToolView];
toolView.frame = CGRectMake(self.view.frame.size.width / 2 - 100, 200, 200, 40);
// 设置库存量  不设置默认为1
toolView.maxNumber = 10;
toolView.delegate = self;
[self.view addSubview:toolView];


#pragma - mark      ---------- JGNumberToolViewDelegate ----------
/**
*  工具条的数量正在编辑
*
*  @param toolView  工具栏对象
*  @param textField 工具栏中的输入框
*  @param text      输入框值改变后的结果
*/
- (void)toolView:(JGNumberToolView *)toolView textField:(UITextField *)textField didChangeWithText:(NSString *)text{
    // 拿到加减后的输入框的内容方式一：
    NSLog(@"text == %@", text);
}

```

## 三、扩展(提供外部配置的属性)
## <a id="JGNumberToolView.h"></a>JGNumberToolView.h
```objc

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

```

## 四、总结
### 1、此demo比较简单，适合初学者

