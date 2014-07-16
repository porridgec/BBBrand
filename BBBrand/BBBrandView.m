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

    [self initData];
    [self setupSelf];
    
    return self;
}

- (void)initData
{
//    NSURL *url = [NSURL URLWithString:@"http://m.feifei.com/api/brand/getBrandList"];
//    NSError *error;
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
//    NSArray *brandsDictArr = [responseDict objectForKey:@"result"];
    
    /* simulate
     */
    self.brandsTitleDict = [[NSMutableDictionary alloc] init];
    [self.brandsTitleDict setObject:@[@"a",@"aa",@"aaa"] forKey:@"A"];
    [self.brandsTitleDict setObject:@[@"b",@"bb",@"bbb"] forKey:@"B"];
    [self.brandsTitleDict setObject:@[@"c",@"cc",@"ccc"] forKey:@"C"];
    //
    
    self.allValuesInDict = [[NSMutableArray alloc] initWithArray:[self.brandsTitleDict allValues]];
    self.allKeysInDict   = [[NSMutableArray alloc] initWithArray:[self.brandsTitleDict allKeys]];
    
}
- (void)setupSelf
{
    self.brandsTableView            = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.viewframe.size.width, self.viewframe.size.height)];
    self.brandsTableView.dataSource = self;
    self.brandsTableView.delegate   = self;
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
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.allKeysInDict count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.allValuesInDict objectAtIndex:section] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BrandCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSUInteger row = [indexPath row];
    NSUInteger  section = indexPath.section;

//    if(section == 0)
//        cell.textLabel.text = @" ";
//    else
//        cell.textLabel.text = [[self.contentsArray objectAtIndex:section] objectAtIndex:row];
    
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(0, 0, 320, 0.5);
//    layer.backgroundColor = [UIColor grayColor].CGColor;
//    
//    [cell.layer addSublayer:layer];
    
    cell.textLabel.text = [[self.allValuesInDict objectAtIndex:section] objectAtIndex:row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


// set Header
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.allKeysInDict objectAtIndex:section];
}
// index
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.allKeysInDict;
}

//custom Header.
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView* myView = [[UIView alloc] init];
//    myView.backgroundColor = [UIColor yellowColor];
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
//    titleLabel.backgroundColor = [UIColor redColor];
//    titleLabel.textColor=[UIColor greenColor];
//    titleLabel.backgroundColor = [UIColor clearColor];
//    
//    if (section == 0){
//        titleLabel.text = @"1";
//    }
//    else if (section == 1)
//    {
//        titleLabel.text = @"2";
//    }
//    else
//    {
//        titleLabel.text = @"3";
//    }
//    
//    [myView addSubview:titleLabel];
//    
//    return myView;
//}

@end
