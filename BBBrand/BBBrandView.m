//
//  BBBrandView.m
//  BBBrand
//
//  Created by Hahn.Chan on 7/15/14.
//  Copyright (c) 2014 Hahn.Chan. All rights reserved.
//

#import "BBBrandView.h"

@implementation BBBrandView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    [self setupSelf];
    return self;
}

- (void)setupSelf
{
    UILabel *tmp = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    DLog();
    tmp.backgroundColor = [UIColor redColor];
    tmp.text = @"hehe";
    tmp.textAlignment = NSTextAlignmentCenter;
    [self addSubview:tmp];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
