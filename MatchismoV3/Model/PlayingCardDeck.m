//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Pappy on 2/3/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init {
    self = [super init];
    
    if (self) {
        
        for (NSUInteger suit = 1; suit <= [PlayingCard validSuits].count; suit++) {
        
            for (NSUInteger rank = 1; rank <= [PlayingCard validRanks].count; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card atTop:YES];
            }
        }
        
    }
    
    return self;
}

@end
