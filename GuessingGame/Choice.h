//
//  Choice.h
//  GuessingGame
//
//  Created by Tracy Brandt Jr on 4/1/13.
//  Copyright (c) 2013 OneRedCup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Choice : NSObject

@property (nonatomic) NSInteger value;
@property (nonatomic) BOOL isAnswer;
@property (nonatomic) BOOL isEnabled;

@end
