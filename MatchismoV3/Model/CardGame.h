//
//  CardGame.h
//  Matchismo
//
//  Created by Pappy on 2/16/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "MatchResult.h"

@interface CardGame : NSObject

@property (strong, nonatomic) NSMutableArray *cards;

@property (nonatomic) int score;

// *** Designated Initializer *********************
- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;

- (Card *)cardAtIndex:(NSUInteger)index;

// Abstract method - must override in subclasses!!!!
- (MatchResult *)flipCardAtIndex:(NSUInteger)index;

@end
