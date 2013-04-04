//
//  ScoresViewController.h
//  CatGuessingGame
//
//  Created by Tracy Brandt Jr on 4/4/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoresViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
