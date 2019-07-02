//
//  ZXBaseTableViewController.h
//  ZXAlertView
//
//  Created by ozx on 2018/6/2.
//  Copyright © 2018 ozx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXContentModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^CellSelectedBlock)(NSInteger index);

@interface ZXBaseTableViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

/** 数据源数组 */
@property (nonatomic, strong) NSMutableArray <ZXContentModel *> *dataArray;
/** cell点击时回调 */
@property (nonatomic, copy) CellSelectedBlock cellSelectedBlock;

@end

NS_ASSUME_NONNULL_END
