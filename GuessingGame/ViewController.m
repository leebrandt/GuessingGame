//
//  ViewController.m
//  GuessingGame
//
//  Created by Tracy Brandt Jr on 3/28/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) NSInteger tries;
@property (nonatomic) NSInteger answer;
@property (nonatomic) NSInteger wins;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.answer = arc4random_uniform(8) + 1;
    //[[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"wins"]; //to reset during testing
    self.wins = [[NSUserDefaults standardUserDefaults] integerForKey:@"wins"];
    self.winLabel.text = [NSString stringWithFormat:@"Wins: %d", self.wins];
    if(self.wins>=3) [self.guessButtons setValue:[NSNumber numberWithBool:YES] forKey:@"hidden"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)buttonPressed:(UIButton *)sender
{
    self.tries++;
    NSInteger guess = sender.titleLabel.text.intValue;
    
    NSLog(@"You guessed: %d and the answer is: %d", guess, self.answer);
    
    if(guess == self.answer)
    {
        self.wins++;
        [[NSUserDefaults standardUserDefaults] setInteger:self.wins forKey:@"wins"];
        self.winLabel.text = [NSString stringWithFormat:@"Wins: %d", self.wins];
        [self.guessButtons setValue:[NSNumber numberWithBool:YES] forKey:@"hidden"];
        if(self.wins<3){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"That's Right!"
                                                            message:@"You are the smartest person alive!"
                                                           delegate:self
                                                  cancelButtonTitle:@"Play Again"
                                                  otherButtonTitles:nil , nil];
            [alert show];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"That's Right!"
                                                            message:@"You Have Beaten the Guessing Game!!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil , nil];
            [alert show];
        }
        return;
    }
    else{
        [sender setHidden:YES];
    }
    if(self.tries>=4){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:@"4 tries is all ya get" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil , nil];
        [alert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(self.wins<3){
        [self.guessButtons setValue:[NSNumber numberWithBool:NO] forKey:@"hidden"];
        self.tries = 0;
        self.answer = arc4random_uniform(8)+1;
    }
}


@end
