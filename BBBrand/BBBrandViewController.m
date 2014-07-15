//
//  BBBrandViewController.m
//  BBBrand
//
//  Created by Bloodshed on 7/15/14.
//  Copyright (c) 2014 Hahn.Chan. All rights reserved.
//

#import "BBBrandViewController.h"
#import "BBBrandView.h"

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
    BBBrandView *tmp = [[BBBrandView alloc] initWithFrame:CGRectMake(10, 10, 160  , 240)];
    tmp.backgroundColor = [UIColor yellowColor];
    DLog();
    [self.view addSubview:tmp];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
