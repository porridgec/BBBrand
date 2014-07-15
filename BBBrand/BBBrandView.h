//
//  BBBrandView.h
//  BBBrand
//
//  Created by Hahn.Chan on 7/15/14.
//  Copyright (c) 2014 Hahn.Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBBrandView : UIView <UITableViewDataSource,UITableViewDelegate>
@property CGRect viewframe;
@property (nonatomic,strong) NSMutableArray *brandsArray;
@property (nonatomic,strong) UITableView *brandsTableView;


@end
