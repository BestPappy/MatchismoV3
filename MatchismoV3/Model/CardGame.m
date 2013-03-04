//
//  CardGame.m
//  Matchismo
//
//  Created by Pappy on 2/16/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "CardGame.h"

@implementation CardGame

// *** Designated Initializer *********************
- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck {
    
    self = [super init];
    
    if (self) {
        for (int i = 1; i <= count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
                break;
            } else {
                [self.cards addObject:card];
            }
        }
    }
    
    return self;
}

// Use lazy instantiation if cards array doesn't already exist
- (NSMutableArray *) cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < self.cards.count) ? self.cards[index] : nil;
}

// Abstract method - must override in subclasses!!!!
- (MatchResult *)flipCardAtIndex:(NSUInteger)index {
    return nil;
}

@end
