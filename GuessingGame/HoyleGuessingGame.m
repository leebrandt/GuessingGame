//
//  HoyleGuessingGame.m
//  GuessingGame
//
//  Created by Tracy Brandt Jr on 4/2/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import "HoyleGuessingGame.h"
#import "Choice.h"
@interface HoyleGuessingGame()
@property (nonatomic) NSInteger answer;
-(void)initializeChoicesWithAnswer:(NSInteger)answer;
@property (nonatomic) NSInteger tries;
@property (nonatomic, strong) NSMutableArray *choices; //of Choice
@end

@implementation HoyleGuessingGame



-(void)initializeChoicesWithAnswer:(NSInteger)answer{
    for (int i=0; i<maxChoices; i++) {
        Choice *choice = [[Choice alloc] init];
        choice.value = i;
        [self.choices addObject:choice];
    }
}
@end
