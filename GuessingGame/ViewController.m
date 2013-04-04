//
//  ViewController.m
//  GuessingGame
//
//  Created by Tracy Brandt Jr on 3/28/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import "ViewController.h"
#import "Choice.h"

@interface ViewController ()
@property (nonatomic, strong) GuessingGame *game;
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.game = [[GuessingGame alloc] initWithMaxChoices:[self.guessButtons count]];
    self.game.wins = [[NSUserDefaults standardUserDefaults] integerForKey:@"wins"];
    self.game.maxTries = 4;
    self.game.maxWins = 3;
}

-(void)syncUI{
    for (UIButton *guessButton in self.guessButtons) {
        Choice *choice = [self.game choiceAtIndex:[self.guessButtons indexOfObject:guessButton]];
        guessButton.titleLabel.text = [NSString stringWithFormat:@"%d", choice.value];
        [guessButton setHidden:!choice.isEnabled];
    }
    
    for (UIImageView *winCat in self.winCats) {
        NSInteger winDex = [self.winCats indexOfObject:winCat];
        if( winDex < (self.game.wins)){
            [winCat setHidden:NO];
        }
    }
    [self.coolCat setHidden:self.game.wins < 3];
}

-(IBAction)buttonPressed:(UIButton *)sender
{
    Choice *choice = [self.game choiceAtIndex:[self.guessButtons indexOfObject:sender]];
    [self.game guess:choice];
    if(self.game.isWinner){
        [self showWinnerMessage];
    }else{
        if (!self.game.canGuessAgain) {
            [self showAlertWithMessage:@"Carnac, you are not." title:@"Loser!" button:@"Play Again?"];
        }
    }
    [self syncUI];
}

-(void)showWinnerMessage{
    if(self.game.wins<self.game.maxWins){
        [self showAlertWithMessage:@"Winner, winner, chicken dinner!" title:@"Winner!" button:@"Play Again?"];
    }else{
        [self showAlertWithMessage:@"OK, you're done smarty pants." title:@"Dominator!" button:@"OK"];
    }
}

-(void)showAlertWithMessage:(NSString *)message title:(NSString *)title button:(NSString *)button
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:button otherButtonTitles:nil, nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.game resetGame];
    [self syncUI];
}

@end