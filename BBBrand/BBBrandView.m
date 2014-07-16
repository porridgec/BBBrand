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
    [self.brandsTitleDict setObject:@[@"cd",@"cc",@"ccc"] forKey:@"D"];
    [self.brandsTitleDict setObject:@[@"ce",@"cc",@"ccc"] forKey:@"E"];
    [self.brandsTitleDict setObject:@[@"cf",@"cc",@"ccc"] forKey:@"F"];
    [self.brandsTitleDict setObject:@[@"cg",@"cc",@"ccc"] forKey:@"G"];
    [self.brandsTitleDict setObject:@[@"ch",@"cc",@"ccc"] forKey:@"H"];
    
    self.allKeysInDict   = [[NSMutableArray alloc] initWithArray:[self.brandsTitleDict allKeys]];
    self.allKeysInDictSorted = [self.allKeysInDict sortedArrayUsingSelector:@selector(compare:)];
    
}
- (void)setupSelf
{
    self.brandsTableView            = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.viewframe.size.width, self.viewframe.size.height)];
    self.brandsTableView.dataSource = self;
    self.brandsTableView.delegate   = self;
    [self addSubview:_brandsTableView];
}

#pragma mark - Table view data source
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.allKeysInDict count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [[self.brandsTitleDict objectForKey:[self.allKeysInDictSorted objectAtIndex:section]] count];
    
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

    cell.textLabel.text = [[self.brandsTitleDict objectForKey:[self.allKeysInDictSorted objectAtIndex:section]] objectAtIndex:row];
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
    return 44;
}

#pragma mark - index
// set Header
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.allKeysInDictSorted objectAtIndex:section];
}
// index
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.allKeysInDictSorted;
}

@end
