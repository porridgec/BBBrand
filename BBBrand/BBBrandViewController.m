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
    UIImage *bgd = [UIImage imageNamed:@"back.png"];
    UIImageView *bgdView = [[UIImageView alloc] initWithImage:bgd];
    bgdView.alpha = 0.90f;
    
    
    

//    BBBrandView *tmp = [[BBBrandView alloc] initWithFrame:CGRectMake(0, bgdView.frame.origin.y + bgdView.bounds.size.height, 320, self.view.bounds.size.height - bgdView.bounds.size.height)];
    BBBrandView *tmp = [[BBBrandView alloc] initWithFrame:CGRectMake(0, 100, 320, self.view.bounds.size.height - 100)];
    //DLog();
    [self.view addSubview:tmp];
    [self.view addSubview:bgdView];
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
