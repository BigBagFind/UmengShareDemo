//
//  TggShareView.m
//  UmengShareDemo
//
//  Created by 铁拳科技 on 16/8/25.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TggShareView.h"
#import "TggShareItem.h"
#import "TggShareCell.h"
#import "TggEasyTool.h"
#import "UIViewExt.h"
#import "UMSocial.h"
#import "UIView+ViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define itemWidth   70
#define margin      (kScreenWidth - itemWidth * 4) / 7


static NSString *const identifier = @"ReusableCell";

@interface TggShareView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UMSocialUIDelegate>

/** 遮盖层 */
@property (nonatomic, strong) UIView *maskView;

/** 底部ViewBg */
@property (nonatomic, strong) UIView *mainBg;

/** 分享项目视图 */
@property (nonatomic, strong) UICollectionView *collectionView;

/** 取消分享按钮 */
@property (nonatomic, strong) UIButton *cancelButton;

/** 分享项目数据源 */
@property (nonatomic, strong) NSMutableArray *dataSource;


@end

@implementation TggShareView


/** 窗口弹出分享视图 */
+ (void)presentShareView {
    NSLog(@"%@",[UIApplication sharedApplication].keyWindow );
    TggShareView *shareView = [TggShareView shareView];
    [[UIApplication sharedApplication].keyWindow addSubview:shareView];
    [shareView animation];
}

/** 类方法初始化 */
+ (instancetype)shareView {
    return [[TggShareView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

/** 重写initFrame */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
        [self placeSubviews];
    }
    return self;
}

/** 构建好视图 */
- (void)prepare {
    self.backgroundColor = [UIColor clearColor];
    
    // maskView
    self.maskView = [[UIView alloc] init];
    self.maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [self addSubview:self.maskView];
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleCancelEventWithSender:)];
    [self.maskView addGestureRecognizer:tapGes];
    
    // mainBg
    self.mainBg = [[UIView alloc] init];
    [self addSubview:self.mainBg];
    self.mainBg.backgroundColor = [UIColor clearColor];

    // CollectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.mainBg addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor colorWithRed:227 / 255.0 green:227 / 255.0 blue:227 / 255.0 alpha:1.0];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[TggShareCell class] forCellWithReuseIdentifier:identifier];
    
    // cancelButton
    self.cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.cancelButton setBackgroundImage:[TggEasyTool tggAlterToImageWithColor:[UIColor colorWithRed:243 / 255.0 green:243 / 255.0 blue:243 / 255.0 alpha:1.0]] forState:UIControlStateNormal];
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.cancelButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.mainBg addSubview:self.cancelButton];
    [self.cancelButton addTarget:self action:@selector(handleCancelEventWithSender:) forControlEvents:UIControlEventTouchUpInside];
    
}

/** 布好局 */
- (void)placeSubviews {
    self.mainBg.frame = CGRectMake(0, kScreenHeight - 50 - itemWidth * 2 - margin * 5, kScreenWidth, itemWidth * 2 + margin * 5 + 50);
    self.maskView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.collectionView.frame = CGRectMake(0, 0, kScreenWidth, itemWidth * 2 + margin * 5);
    self.cancelButton.frame = CGRectMake(0, self.mainBg.height - 50, kScreenWidth, 50);
    [self.collectionView reloadData];
}

/** 做动画 */
- (void)animation {
    self.mainBg.top = kScreenHeight;
    self.maskView.alpha = 0.f;
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:20 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.maskView.alpha = 1.0;
        self.mainBg.top = kScreenHeight - 50 - itemWidth * 2 - margin * 5;
    } completion:nil];
}

/** 取消按钮点击事件 */
- (void)handleCancelEventWithSender:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.mainBg.top = kScreenHeight;
        self.maskView.alpha = 0.f;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - 重写Setter和Getter
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        NSArray *icons = @[@"share_wechat",
                           @"share_friend",
                           @"share_qq",
                           @"share_qqzone",
                           @"share_sina"];
        NSArray *titles = @[@"微信",@"朋友圈",@"QQ",@"QQ空间",@"微博"];
        for (NSUInteger i = 0; i < icons.count; i++) {
            TggShareItem *item = [[TggShareItem alloc] init];
            item.icon = icons[i];
            item.title = titles[i];
            [_dataSource addObject:item];
        }
    }
    return _dataSource;
}


#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TggShareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.item];
    cell.backgroundColor = [UIColor clearColor];
    
    cell.selectedBlock = ^ {
        NSLog(@"第几个被点了：%zd",indexPath.row);
        [self shareWithIndexPath:indexPath];
    };
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(margin * 2, margin * 2, margin * 2, margin * 2);
}


#pragma mark - 配置分享内容
- (void)shareWithIndexPath:(NSIndexPath *)indexPath {
    NSString *shareText = @"来吧，这里先放一个内容。。。";
    NSString *urlStr = @"http://www.jianshu.com/users/3f4850cbfc26/latest_articles";
    switch (indexPath.item) {
        case 0:
            [UMSocialData defaultData].extConfig.wechatSessionData.title = @"wechatTimeLine的title";
            [UMSocialData defaultData].extConfig.wechatSessionData.url = urlStr;
            [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:shareText image:[UIImage imageNamed:@"tgg_icon"] location:nil urlResource:nil presentedController:self.viewController completion:^(UMSocialResponseEntity *response){
                if (response.responseCode == UMSResponseCodeSuccess) {
                    NSLog(@"微信朋友圈分享成功！");
                }
            }];
            break;
        case 1:
            [UMSocialData defaultData].extConfig.wechatTimelineData.url = urlStr;
            [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"wechatSession的title";
            [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatTimeline] content:shareText image:[UIImage imageNamed:@"tgg_icon"] location:nil urlResource:nil presentedController:self.viewController completion:^(UMSocialResponseEntity *response){
                if (response.responseCode == UMSResponseCodeSuccess) {
                    NSLog(@"微信好友分享成功！");
                }
            }];
            break;
        case 2:
            [UMSocialData defaultData].extConfig.qqData.url = urlStr;
            [UMSocialData defaultData].extConfig.qqData.title = @"qqFriend的title";
            [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQQ] content:shareText image:[UIImage imageNamed:@"tgg_icon"] location:nil urlResource:nil presentedController:self.viewController completion:^(UMSocialResponseEntity *response){
                if (response.responseCode == UMSResponseCodeSuccess) {
                    NSLog(@"qq好友分享成功！");
                }
            }];
            break;
        case 3:
            [UMSocialData defaultData].extConfig.qzoneData.url = urlStr;
            [UMSocialData defaultData].extConfig.qzoneData.title = @"qqZone的title";
            [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQzone] content:shareText image:[UIImage imageNamed:@"tgg_icon"] location:nil urlResource:nil presentedController:self.viewController completion:^(UMSocialResponseEntity *response){
                if (response.responseCode == UMSResponseCodeSuccess) {
                    NSLog(@"QQ空间分享成功！");
                }
            }];
            break;
        case 4:
            [[UMSocialControllerService defaultControllerService] setShareText:[NSString stringWithFormat:@"%@ %@",shareText,urlStr] shareImage:[UIImage imageNamed:@"tgg_icon"] socialUIDelegate:self];
            //设置分享内容和回调对象
            [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self.viewController,[UMSocialControllerService defaultControllerService],YES);
            break;
        default:
            break;
    }
}





@end
