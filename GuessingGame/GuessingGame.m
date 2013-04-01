//
//  GuessingGame.m
//  GuessingGame
//
//  Created by Tracy Brandt Jr on 4/1/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import "GuessingGame.h"
@interface GuessingGame()
@property (nonatomic, readwrite) NSInteger answer;
-(void)initializeChoicesWithAnswer:(NSInteger)answer;
@end

@implementation GuessingGame

- (id)initWithMaxChoices:(NSInteger)maxChoices
{
    self = [super init];
    if (self) {
        self.canGuessAgain = YES;
        self.maxChoices = maxChoices;
        self.answer = arc4random() % maxChoices;
    }
    return self;
}

-(void)initializeChoicesWithAnswer:(NSInteger)answer{
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
    }else{
        self.canGuessAgain = self.tries < 4;
    }
}

@end
