//
//  RefreshTableView.h
//  VeinOfBusiness
//
//  Created by mgfjx on 2017/3/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@protocol RefreshTableViewRefreshDelegate <NSObject>
@optional
- (void)headerRefreshing;
- (void)footerLoadingMore;

@end

@interface RefreshTableView : UITableView

@property (nonatomic, strong) MJRefreshNormalHeader *headerRefreshView;
@property (nonatomic, strong) MJRefreshBackNormalFooter *footerRefreshView;
@property (nonatomic, weak) id<RefreshTableViewRefreshDelegate> refreshDelegate;

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                    isRefresh:(BOOL)isRefresh
                   isLoadMore:(BOOL)isLoadMore;

- (void)endRefreshAndReloadData;

@end
