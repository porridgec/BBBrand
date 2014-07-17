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

#pragma mark - setup
- (void)initData
{
    //get dictionary of all brands
    NSURL *url = [NSURL URLWithString:@"http://m.feifei.com/api/brand/getBrandList"];
    NSError *error;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    //
    
    
    self.resultDict          = [responseDict objectForKey:@"result"];
    self.allKeysInDict       = [[NSMutableArray alloc] initWithArray:[self.resultDict allKeys]];
    self.allKeysInDictSorted = [self.allKeysInDict sortedArrayUsingSelector:@selector(compare:)];
    
}
- (void)setupSelf
{
    self.brandsTableView                             = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.viewframe.size.width, self.viewframe.size.height)];
    self.brandsTableView.dataSource                  = self;
    self.brandsTableView.delegate                    = self;
    self.brandsTableView.sectionIndexBackgroundColor = [UIColor whiteColor];
    self.brandsTableView.sectionIndexColor           = [UIColor colorWithRed:0.37 green:0.71 blue:0.39
                                                                alpha:1.00];
    
    self.brandsTableView.sectionHeaderHeight = 23;
    self.brandsTableView.sectionIndexBackgroundColor = [UIColor redColor];
    [self addSubview:_brandsTableView];
}

#pragma mark - Table view data source
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.allKeysInDict count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.resultDict objectForKey:[self.allKeysInDictSorted objectAtIndex:section]]count];
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

    cell.textLabel.text = [@" " stringByAppendingString:[[[self.resultDict objectForKey:[self.allKeysInDictSorted objectAtIndex:section]] objectAtIndex:row] objectForKey:@"name"]];
    cell.textLabel.textColor = [UIColor colorWithRed:0.33 green:0.33 blue:0.33 alpha:1.00];

    
    CALayer *buttomLineLayer        = [CALayer layer];
    buttomLineLayer.frame           = CGRectMake(0, 39.5 , 320, 0.5);
    buttomLineLayer.backgroundColor = [UIColor colorWithRed:0.78 green:0.78 blue:0.80 alpha:1.00].CGColor;
    
    [cell.layer addSublayer:buttomLineLayer];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //into searhc view
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

#pragma mark - index
// set Header
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if([[self.allKeysInDictSorted objectAtIndex:section] isEqual:@"other"])
        return @"#";
    return [self.allKeysInDictSorted objectAtIndex:section];
}
// index
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *tmp = [[NSMutableArray alloc] initWithArray:self.allKeysInDictSorted];
    [tmp removeLastObject];
    [tmp addObject:@"#"];
    return tmp;
}

#pragma mark - custom Header of index
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *customHeaderView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 23)];
    customHeaderView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];
    UILabel *indexLabel              = [[UILabel alloc] initWithFrame:CGRectMake(22, 0, 100, 23)];
    
    if([[self.allKeysInDictSorted objectAtIndex:section] isEqual:@"other"])
        indexLabel.text = @"#";
    else
        indexLabel.text = [self.allKeysInDictSorted objectAtIndex:section];
    
    [self.allKeysInDictSorted objectAtIndex:section];

    indexLabel.textColor = [UIColor colorWithRed:0.37 green:0.71 blue:0.39 alpha:1.0];
    
    [customHeaderView addSubview:indexLabel];
    
    
    
    CALayer *topLineLayer           = [CALayer layer];
    topLineLayer.frame              = CGRectMake(0, 0, 320, 0.5);
    topLineLayer.backgroundColor = [UIColor colorWithRed:0.78 green:0.78 blue:0.80 alpha:1.00].CGColor;

    
    CALayer *buttomLineLayer        = [CALayer layer];
    buttomLineLayer.frame           = CGRectMake(0, 22.5 , 320, 0.5);
    buttomLineLayer.backgroundColor = [UIColor colorWithRed:0.78 green:0.78 blue:0.80 alpha:1.00].CGColor;
    
    [customHeaderView.layer addSublayer:buttomLineLayer];
    [customHeaderView.layer addSublayer:topLineLayer];
    return customHeaderView;
}
@end
