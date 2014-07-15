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
    self.viewframe = frame;
    [self setupSelf];
    self.brandsArray = [[NSMutableArray alloc] initWithObjects:@"real madrid",@"bacelona",@"man utd",@"arsenal",@"liverpool",@"ac milan",@"milan international",@"guangzhou evergrande", nil];
    [self setupSelf];
    
//    self.dataSource = self;
//    self.delegate   = self;
    return self;
}

- (void)setupSelf
{
    self.backgroundColor = [UIColor blueColor];
    NSLog(@"frame  x: %f ,y: %f, height: %f, width: %f\n",self.viewframe.origin.x,
              self.viewframe.origin.y,
              self.viewframe.size.height,self.viewframe.size.width);
    self.brandsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.viewframe.size.width, self.viewframe.size.height)];
    //self.brandsTableView.backgroundColor = [UIColor redColor];

    self.brandsTableView.dataSource      = self;
    self.brandsTableView.delegate        = self;
    [self addSubview:_brandsTableView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.brandsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FirstLevelCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.brandsArray objectAtIndex:row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ;
    
}

@end
