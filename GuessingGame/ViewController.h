//
//  ViewController.h
//  GuessingGame
//
//  Created by Tracy Brandt Jr on 3/28/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *winCats;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *guessButtons;

-(IBAction)buttonPressed:(id)sender;

@end
