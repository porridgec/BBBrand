//
//  BBBrandView.h
//  BBBrand
//
//  Created by Hahn.Chan on 7/15/14.
//  Copyright (c) 2014 Hahn.Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDIIndexBar.h"

@interface BBBrandView : UIView <UITableViewDataSource,UITableViewDelegate,GDIIndexBarDelegate>

@property CGRect viewframe;

@property (strong,nonatomic) UITableView         *brandsTableView;

@property (strong,nonatomic) NSMutableDictionary *resultDict;
/* resultDict is like
 * {
 *    "A" : @[......];
 *    "B" : @[......];
 *     .
 *     .
 *  }
 *
 */
@property (strong,nonatomic) NSMutableArray      *allKeysInDict;
@property (strong,nonatomic) NSArray             *allKeysInDictSorted;


@end
