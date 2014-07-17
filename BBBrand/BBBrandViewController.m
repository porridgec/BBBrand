//
//  BBBrandViewController.m
//  BBBrand
//
//  Created by Bloodshed on 7/15/14.
//  Copyright (c) 2014 Hahn.Chan. All rights reserved.
//

#import "BBBrandViewController.h"
#import "BBBrandView.h"
#import "GDIIndexBar.h"

@interface BBBrandViewController ()

@end

@implementation BBBrandViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView
{
    UIImage *bgd = [UIImage imageNamed:@"back.png"];
    UIImageView *bgdView = [[UIImageView alloc] initWithImage:bgd];
    bgdView.alpha = 0.90f;
    

    BBBrandView *brandsTableView = [[BBBrandView alloc] initWithFrame:CGRectMake(0, 100, 270, self.view.bounds.size.height - 100)];
    brandsTableView.vc = self;

    [self.view addSubview:brandsTableView];
    
    [self.view addSubview:bgdView];
    
    
}



@end
