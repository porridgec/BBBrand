//
//  BBBrandView.m
//  BBBrand
//
//  Created by Hahn.Chan on 7/15/14.
//  Copyright (c) 2014 Hahn.Chan. All rights reserved.
//

#import "BBBrandView.h"
#import "GDIIndexBar.h"

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
    self.finalDict           = [[NSMutableDictionary alloc] init];
    self.allNumberKeyValues  = [[NSMutableArray alloc] init];
    self.otherValues         = [[NSArray alloc] init];
    self.allKeysInDict       = [[NSMutableArray alloc] initWithArray:[self.resultDict allKeys]];
    
    self.allNumberKeys = [[NSMutableArray alloc] init];
    self.allKeysInDictWithoutNumberKeys = [[NSMutableArray alloc] init];
    for(NSUInteger i = 0 ;i < self.allKeysInDict.count;i ++){
        if([[self.allKeysInDict objectAtIndex:i] isEqualToString:@"0"] ||
           [[self.allKeysInDict objectAtIndex:i] isEqualToString:@"1"] ||
           [[self.allKeysInDict objectAtIndex:i] isEqualToString:@"2"] ||
           [[self.allKeysInDict objectAtIndex:i] isEqualToString:@"3"] ||
           [[self.allKeysInDict objectAtIndex:i] isEqualToString:@"4"] ||
           [[self.allKeysInDict objectAtIndex:i] isEqualToString:@"5"] ||
           [[self.allKeysInDict objectAtIndex:i] isEqualToString:@"6"] ||
           [[self.allKeysInDict objectAtIndex:i] isEqualToString:@"7"] ||
           [[self.allKeysInDict objectAtIndex:i] isEqualToString:@"8"] ||
           [[self.allKeysInDict objectAtIndex:i] isEqualToString:@"9"] ){
            [self.allNumberKeys addObject:[self.allKeysInDict objectAtIndex:i]];
            [self.allNumberKeyValues addObjectsFromArray:[self.resultDict objectForKey:[self.allKeysInDict objectAtIndex:i]]];
        }
        else{
            [self.allKeysInDictWithoutNumberKeys addObject:[self.allKeysInDict objectAtIndex:i]];
        }
    }
    self.allKeysInDictWithoutNumberKeysSorted = [self.allKeysInDictWithoutNumberKeys sortedArrayUsingSelector:@selector(compare:)];
    
    for(NSUInteger j = 0; j < self.allKeysInDictWithoutNumberKeysSorted.count; j ++){
        [self.finalDict setObject:[self.resultDict objectForKey:[self.allKeysInDictWithoutNumberKeysSorted objectAtIndex:j]] forKey:[self.allKeysInDictWithoutNumberKeysSorted objectAtIndex:j]];
    }
    self.otherValues = [[self.finalDict objectForKey:@"other"] arrayByAddingObjectsFromArray:self.allNumberKeyValues];
    
    [self.finalDict removeObjectForKey:@"other"];
    [self.finalDict setObject:self.otherValues forKey:@"other"];
    

    
}
- (void)setupSelf
{
    self.brandsTableView                              = [[UITableView alloc] initWithFrame:
                                                         CGRectMake(0,
                                                                    0,
                                                                    self.viewframe.size.width,
                                                                    self.viewframe.size.height)];
    self.brandsTableView.dataSource                   = self;
    self.brandsTableView.delegate                     = self;
    self.brandsTableView.sectionHeaderHeight          = 23;
    self.brandsTableView.showsVerticalScrollIndicator = NO;
    [self addSubview:_brandsTableView];
    
    GDIIndexBar *indexBar    = [[GDIIndexBar alloc] initWithTableView:self.brandsTableView];
    indexBar.delegate        = self;
    indexBar.backgroundColor = [UIColor whiteColor];
    indexBar.textColor       = [UIColor colorWithRed:0.37 green:0.71 blue:0.39 alpha:1.0];
    [self addSubview:indexBar];
    
    
}

#pragma mark - Table view data source
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
//    return [self.allKeysInDict count];
    return [self.allKeysInDictWithoutNumberKeysSorted count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [[self.resultDict objectForKey:[self.allKeysInDictSorted objectAtIndex:section]]count];
    return [[self.finalDict objectForKey:[self.allKeysInDictWithoutNumberKeysSorted objectAtIndex:section]]count];
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

//    cell.textLabel.text = [@" " stringByAppendingString:[[[self.resultDict objectForKey:[self.allKeysInDictSorted objectAtIndex:section]] objectAtIndex:row] objectForKey:@"name"]];
        cell.textLabel.text = [@" " stringByAppendingString:[[[self.finalDict objectForKey:[self.allKeysInDictWithoutNumberKeysSorted objectAtIndex:section]] objectAtIndex:row] objectForKey:@"name"]];
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
    //go to next view
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}


#pragma mark - custom Header of index
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *customHeaderView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 23)];
    customHeaderView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];
    UILabel *indexLabel              = [[UILabel alloc] initWithFrame:CGRectMake(22, 0, 100, 23)];
    
//    if([[self.allKeysInDictSorted objectAtIndex:section] isEqual:@"other"])
//        indexLabel.text = @"#";
//    else
//        indexLabel.text = [self.allKeysInDictSorted objectAtIndex:section];
//    
//    [self.allKeysInDictSorted objectAtIndex:section];
    if([[self.allKeysInDictWithoutNumberKeysSorted objectAtIndex:section] isEqual:@"other"])
        indexLabel.text = @"#";
    else
        indexLabel.text = [self.allKeysInDictWithoutNumberKeysSorted objectAtIndex:section];


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


#pragma mark - delegate of IndexBar
- (NSUInteger)numberOfIndexesForIndexBar:(GDIIndexBar *)indexBar
{
//    return self.allKeysInDictSorted.count;
    return self.allKeysInDictWithoutNumberKeysSorted.count;
}

- (NSString *)stringForIndex:(NSUInteger)index
{
//    if (index == self.allKeysInDictSorted.count - 1) {
//        return @"#";
//    }
//    else{
//        return [self.allKeysInDictSorted objectAtIndex:index];
//    }
    if (index == self.allKeysInDictWithoutNumberKeysSorted.count - 1) {
        return @"#";
    }
    else{
        return [self.allKeysInDictWithoutNumberKeysSorted objectAtIndex:index];
    }
}

- (void)indexBar:(GDIIndexBar *)indexBar didSelectIndex:(NSUInteger)index
{
    [self.brandsTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
                          atScrollPosition:UITableViewScrollPositionTop
                                  animated:NO];
}

@end
