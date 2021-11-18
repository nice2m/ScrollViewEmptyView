//
//  UIScrollView+UIScrollView_Addition.h
//  StrenuousExercise
//
//  Created by admin on 2021/9/18.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^UISCrollView_ActionBlock)(UIScrollView * scrollView);
// 默认背景颜色
#define UIScrollView_emptyBgColor [UIColor colorWithRed:22.0 / 255.0 green:19.0 / 255.0 blue:36.0 / 255.0 alpha:1]
// 默认空白图标
#define UIScrollView_emptyImg [[UIImage imageNamed:@"empty_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
// 默认标题
#define UIScrollView_emptyTitle [[NSAttributedString alloc] initWithString:@"空空如也" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13],NSForegroundColorAttributeName: [UIColor colorWithRed:222.0/255.0 green:222.0/255.0 blue:222.0/255.0 alpha:1.0]}];
// 默认标题按钮等各个标题间距
#define UIScrollView_emptyElementSpace 3



// swift5.0 不支持 load 调用，逻辑移到 oc中
@interface UIScrollView (UIScrollView_Addition)

// 当前 tableView 是否支持默认 emptyData;
// 如果设置成NO,那么需 配置  tableview.emptyDataSetDelegate = xxx; tableview.emptyDataSetSource = xxx;
// 默认YES开启,UITableView,UICollectionView 空数据视图
@property (nonatomic, assign) BOOL se_emptyDataSetEnabled;
@property (nonatomic, strong) NSAttributedString * se_emptyDataSetTitle;
@property (nonatomic, strong) UIImage * se_emptyDataSetImg;
@property (nonatomic, assign) CGFloat se_emptyDataSetVerticalOffset;
@property (nonatomic, assign) CGFloat se_emptyDataSetSpaceHeightForEmptyDataSet;
@property (nonatomic, strong) UIColor * se_emptyDataSetBgColor;
@property (nonatomic, copy) UISCrollView_ActionBlock se_emptyDataSetActionClosure;

@end

NS_ASSUME_NONNULL_END
