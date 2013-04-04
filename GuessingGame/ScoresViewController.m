//
//  ScoresViewController.m
//  CatGuessingGame
//
//  Created by Tracy Brandt Jr on 4/4/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import "ScoresViewController.h"

@interface ScoresViewController ()
@property (nonatomic, strong) NSArray *scores;
@end

@implementation ScoresViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Top Scores";
    self.scores = [[NSUserDefaults standardUserDefaults] arrayForKey:@"scores"];
    [self.tableView reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.scores.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    id time = self.scores[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",time];
    return cell;
}

@end
