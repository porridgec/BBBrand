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
    self.brandsArray = [[NSMutableArray alloc] initWithObjects:@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",@"sadasdas",@"sadsad",@"sadsasd2",nil];
    //self.brandsTitleArray = [[NSMutableArray alloc] initWithObjects:
    //                         @"A",@"C",@"F",@"G",@"H",@"M",@"S",@"T",@"X",@"Z", nil];
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
    //NSLog(@"count is %lu\n",(unsigned long)self.brandsArray.count);
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
    return self.brandsArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FirstLevelCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSUInteger row = [indexPath row];
    if(row == 0){
        cell.textLabel.text = @" ";
    }
    else{
        cell.textLabel.text = [self.brandsArray objectAtIndex:row - 1];
    }
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return 100;
    }
    else
        return 44;
}

@end
