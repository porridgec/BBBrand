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
    //self.brandsArray = [[NSMutableArray alloc] initWithObjects:@[@"阿伟",@"阿姨",@"阿三"],nil];
    
    self.sectionTitles       = [[NSArray alloc] initWithObjects:
                           @"A",@"C",@"F",@"G",@"H",@"M",@"S",@"T",@"X",@"Z", nil];
    self.contentsArray       = [[NSArray alloc] initWithObjects:
                           @[@"阿伟",@"阿姨",@"阿三"],
                           @[@"蔡芯",@"成龙",@"陈鑫",@"陈丹",@"成名"],
                           @[@"芳仔",@"房祖名",@"方大同",@"芳芳",@"范伟"],
                           @[@"郭靖",@"郭美美",@"过儿",@"过山车"],
                           @[@"何仙姑",@"和珅",@"郝歌",@"好人"],
                           @[@"妈妈",@"毛主席"],
                           @[@"孙中山",@"沈冰",@"婶婶"],
                           @[@"涛涛",@"淘宝",@"套娃"],
                           @[@"小二",@"夏紫薇",@"许巍",@"许晴"],
                           @[@"周恩来",@"周杰伦",@"张柏芝",@"张大仙"],nil];
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
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionTitles.count ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.brandsArray.count + 1;
    NSArray *tmp = [self.contentsArray objectAtIndex:section];

    if(section == 0)
        return tmp.count + 1;
    else
        return tmp.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FirstLevelCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSUInteger row = [indexPath row];
    NSUInteger  section = indexPath.section;
//    if(row == 0){
//        cell.textLabel.text = @" ";
//    }
//    else{
//        cell.textLabel.text = [self.brandsArray objectAtIndex:row - 1];
//        
//    }
    if(section == 0){
        if(row == 0)
            cell.textLabel.text = @" ";
        else
            cell.textLabel.text = [[self.contentsArray objectAtIndex:section] objectAtIndex:row - 1];
            //cell.textLabel.text = @" ";
    }
    else
        cell.textLabel.text = [[self.contentsArray objectAtIndex:section] objectAtIndex:row];
        //cell.textLabel.text = @" ";
    
    

    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        if(indexPath.row == 0)
            return 100;
        else
            return 44;
    }
    else
        return 44;
}


// 每个分区的页眉
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @" ";
    else
        return [self.sectionTitles objectAtIndex:section];
}
// 索引目录
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sectionTitles;
}



@end
