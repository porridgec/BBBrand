//
//  BBBrandView.h
//  BBBrand
//
//  Created by Hahn.Chan on 7/15/14.
//  Copyright (c) 2014 Hahn.Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GDIIndexBar.h"
#import "BBBrandViewController.h"

@interface BBBrandView : UIView <UITableViewDataSource,UITableViewDelegate, GDIIndexBarDelegate>

@property CGRect viewframe;

@property (strong,nonatomic) UITableView         *brandsTableView;

@property (strong,nonatomic) NSMutableDictionary *resultDict;
@property (strong,nonatomic) NSMutableDictionary *finalDict;
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
@property (strong,nonatomic) NSMutableArray      *allKeysInDictWithoutNumberKeys;
@property (strong,nonatomic) NSMutableArray      *allNumberKeys;
@property (strong,nonatomic) NSMutableArray      *allNumberKeyValues;
@property (strong,nonatomic) NSArray             *otherValues;
@property (strong,nonatomic) NSArray             *allKeysInDictWithoutNumberKeysSorted;

//need a viewController to push/pop a view
//@property (strong,nonatomic) VC *aVC;
//

@end
