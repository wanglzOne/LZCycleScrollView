//
//  CycleScrollVC.m
//  LZCycleScrollView
//
//  Created by bhqm on 2017/11/4.
//  Copyright © 2017年 wanglz. All rights reserved.
//

#import "CycleScrollVC.h"
#import <SDCycleScrollView.h>


@interface CycleScrollVC ()<SDCycleScrollViewDelegate>
{
    NSArray *_imageAry;
    NSArray *_titleAry;
    NSArray *_imageNameAry;
    
}
/** banner轮播图 */
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cyleScro;
/** 纯文字 上下轮播 */
@property (weak, nonatomic) IBOutlet SDCycleScrollView *plaintextScro;

@end

@implementation CycleScrollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadDataAndUI];
    
}
-(void)loadDataAndUI{
    
    // 情景一：采用本地图片实现
    NSArray *imageNames = @[@"h1.jpg",
                            @"h2.jpg",
                            @"h3.jpg",
                            @"h4.jpg",// 本地图片请填写全名
                            ];
    _imageNameAry = imageNames;
    NSArray *imagesURLStrings = @[
                                  @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=49366202,632101467&fm=27&gp=0.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3837133,4087039562&fm=173&s=AC0A955F4E3F2F9E4835593803007010&w=218&h=146&img.JPEG"
                                  ];
    _imageAry = imagesURLStrings;
    NSArray *titles = @[@"新建交流QQ群：185534916 ",
                        @"disableScrollGesture可以设置禁止拖动",
                        @"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com"
                        ];
    _titleAry = titles;
    
    //分类型 的轮播图  // _btnTag 1 ~ 5 网络图片 本地图片 带标题网络图片 带标题本地图片 纯文字上下轮播
    _cyleScro.placeholderImage = [UIImage imageNamed:@"placeholder"];
    if (_btnTag == 1) {
        _cyleScro.imageURLStringsGroup = _imageAry;
        
    }else if (_btnTag == 2){
        _cyleScro.imageURLStringsGroup = _imageNameAry;
        _cyleScro.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;//动画效果

    }else if (_btnTag == 3){
        _cyleScro.imageURLStringsGroup = _imageAry;
        _cyleScro.titlesGroup = _titleAry;
        _cyleScro.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;//page位置
        _cyleScro.currentPageDotColor = [UIColor redColor]; // 当前分页控件小圆标颜色
        _cyleScro.pageDotColor = [UIColor whiteColor];//其他分页控件小圆标颜色

    }else if (_btnTag == 4){
        _cyleScro.imageURLStringsGroup = _imageNameAry;
        _cyleScro.titlesGroup = _titleAry;
        // 创建自定义图片的pageControlDot的图片
        _cyleScro.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
        _cyleScro.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
        
        _cyleScro.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;//page位置
        _cyleScro.currentPageDotColor = [UIColor redColor]; // 当前分页控件小圆标颜色
        _cyleScro.pageDotColor = [UIColor whiteColor];//其他分页控件小圆标颜色
    }else if (_btnTag == 5){
        //纯文字轮播需设置
        _plaintextScro.scrollDirection = UICollectionViewScrollDirectionVertical;
        _plaintextScro.onlyDisplayText = YES;
        _plaintextScro.titleLabelBackgroundColor = [UIColor whiteColor]; //背景色
        _plaintextScro.titleLabelTextColor = [UIColor lightGrayColor]; //字体颜色
        
        NSMutableArray *titlesArray = [NSMutableArray new];
        [titlesArray addObject:@"纯文字上下滚动轮播"];
        [titlesArray addObjectsFromArray:_titleAry];
        _plaintextScro.titlesGroup = [titlesArray copy];
        //设置禁止拖动
        [_plaintextScro disableScrollGesture];
    }else;
    
    if (_btnTag == 5) {
        _plaintextScro.hidden = NO;
        _cyleScro.hidden = YES;
    }else{
        _plaintextScro.hidden = YES;
        _cyleScro.hidden = NO;
    }
    _cyleScro.delegate = self;
    _plaintextScro.delegate = self;
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
