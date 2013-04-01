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
@property (nonatomic) NSInteger tries;
@property (nonatomic) NSInteger answer;
@property (nonatomic) NSInteger wins;
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
        Choice *choice = [self.game choiceAtIndex:[self.guessButtons indexOfObject:guessButton ]];
        NSLog(@"choices %d", choice.value);
        guessButton.titleLabel.text = [NSString stringWithFormat:@"%d", choice.value];
        [guessButton setHidden:choice.isEnabled];
    }
    
    for (UIImageView *winCat in self.winCats) {
        NSInteger winDex = [self.winCats indexOfObject:winCat];
        if( winDex < (self.wins)){
            [winCat setHidden:NO];
        }
    }
    [self.coolCat setHidden:self.wins<3 ];
}

-(IBAction)buttonPressed:(UIButton *)sender
{
    NSLog(@"Guess:%d of %d total guesses", self.game.tries, self.game.maxTries);
    [self.game guess:[self.game.choices objectAtIndex:[self.guessButtons indexOfObject:sender]]];
    if(self.game.isWinner)
    {
        [[NSUserDefaults standardUserDefaults] setInteger:self.game.wins forKey:@"wins"];
        if(self.game.wins < self.game.maxWins){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"That's Right!"
                                                            message:@"You are the smartest person alive!"
                                                           delegate:self
                                                  cancelButtonTitle:@"Play Again"otherButtonTitles:nil , nil];
            [alert show];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"That's Right!"
                                                            message:@"You Have Beaten the Guessing Game!!"
                                                            delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil , nil];
                [alert show];
        }
        
    }
    [self syncUI];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(self.wins<3) {
        [self startNewGame];
    }
}

-(void)startNewGame{
    [self.guessButtons setValue:[NSNumber numberWithBool:NO] forKey:@"hidden"];
    self.tries = 0;
    [self generateAnswer];
}

-(void)generateAnswer{
    do
    {
        self.answer = (arc4random() % 8) + 1;
        NSLog(@"The generated answer was: %d", self.answer);
    }
    while (self.answer == 5);
}
@end