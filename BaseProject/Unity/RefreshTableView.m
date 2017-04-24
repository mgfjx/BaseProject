//
//  RefreshTableView.m
//  VeinOfBusiness
//
//  Created by mgfjx on 2017/3/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RefreshTableView.h"
#import "UIScrollView+MJRefresh.h"

@implementation RefreshTableView

- (instancetype)initWithFrame:(CGRect)frame
                        style:(UITableViewStyle)style
                    isRefresh:(BOOL)isRefresh
                   isLoadMore:(BOOL)isLoadMore {
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        if (isRefresh) {
            self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                if (self.refreshDelegate && [self.refreshDelegate respondsToSelector:@selector(headerRefreshing)]) {
                    [self.refreshDelegate headerRefreshing];
                }
            }];
        }
        
        if (isLoadMore) {
            self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                if (self.refreshDelegate && [self.refreshDelegate respondsToSelector:@selector(footerLoadingMore)]) {
                    [self.refreshDelegate footerLoadingMore];
                }
            }];
        }
        
    }
    return self;
}

- (void)endRefreshing{
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

- (void)endRefreshAndReloadData{
    [self reloadData];
    [self endRefreshing];
}

@end
