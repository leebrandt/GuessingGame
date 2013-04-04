//
//  GuessingGame.h
//  GuessingGame
//
//  Created by Tracy Brandt Jr on 4/1/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Choice.h"

@interface GuessingGame : NSObject

@property (nonatomic) NSInteger wins;
@property (nonatomic) NSInteger maxWins;
@property (nonatomic) NSInteger maxTries;
@property (nonatomic) NSInteger maxChoices;
@property (nonatomic) NSTimeInterval duration;
@property (nonatomic) BOOL canGuessAgain;
@property (nonatomic) BOOL isWinner;

-(void)startGame;
-(void)guess:(Choice *)choice;
-(Choice *)choiceAtIndex:(NSUInteger)index;
-(void)resetGame;

@end
