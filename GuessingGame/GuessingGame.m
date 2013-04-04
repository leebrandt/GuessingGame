//
//  GuessingGame.m
//  GuessingGame
//
//  Created by Tracy Brandt Jr on 4/1/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import "GuessingGame.h"
#import "FunkyGuessingGame.h"

#define DEFAULT_MAX_CHOICES 9

@interface GuessingGame()
@property (nonatomic) NSInteger answer;
@property (nonatomic) NSInteger tries;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, strong) NSMutableArray *choices; //of Choice

-(void)initializeChoicesWithAnswer:(NSInteger)answer;
@end

@implementation GuessingGame

-(NSMutableArray *)choices{
    
    if(!_choices) _choices = [[NSMutableArray alloc] init];
    return _choices;
}

- (void)startGame
{
    self.canGuessAgain = YES;
    self.maxChoices = DEFAULT_MAX_CHOICES;
    self.answer = [self generateRandomAnswer];
    self.startTime = [NSDate date];
}

-(void)initializeChoicesWithAnswer:(NSInteger)answer{
    [self.choices removeAllObjects];
    
    NSLog(@"%d", answer);
    for (int i = 1; i <= self.maxChoices; i++) {
        Choice *choice = [[Choice alloc] init];
        choice.value = i;
        choice.isEnabled = YES;
        choice.isAnswer = i == answer;
        [self.choices addObject:choice];
    }
}

-(void)setAnswer:(NSInteger)answer
{
    _answer = answer;
    [self initializeChoicesWithAnswer:answer];
}

-(Choice *)choiceAtIndex:(NSUInteger)index{
    return (index < [self.choices count]) ? self.choices[index] : nil;
}

-(void)guess:(Choice *)choice{
    self.tries++;
    if(choice.isAnswer){
        self.wins++;
        self.isWinner = YES;
        self.duration = [self.startTime timeIntervalSinceDate:[NSDate date]];
    }else{
        self.canGuessAgain = self.tries < self.maxTries;
        if(!self.canGuessAgain){
            [self.choices setValue:[NSNumber numberWithBool:NO] forKey:@"isEnabled"];
        }else{
            choice.isEnabled = NO;
        }
    }
}

-(NSInteger)generateRandomAnswer{
    NSInteger results;
    
    do{
     results = (arc4random() % self.maxChoices) + 1;
    }while (results == 5);
    
    return results;
}

-(void)resetGame{
    if(self.wins < self.maxWins){
        self.tries = 0;
        self.isWinner = NO;
        [self initializeChoicesWithAnswer:[self generateRandomAnswer]];
    }
    else{
        [self.choices setValue:[NSNumber numberWithBool:NO] forKey:@"isEnabled"];
    }
}

@end
