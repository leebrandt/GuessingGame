//
//  ViewController.h
//  GuessingGame
//
//  Created by Tracy Brandt Jr on 3/28/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuessingGame.h"

@interface ViewController : UIViewController<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *winCats;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *guessButtons;
@property (strong, nonatomic) IBOutlet UIImageView *coolCat;

-(IBAction)buttonPressed:(id)sender;

@end
