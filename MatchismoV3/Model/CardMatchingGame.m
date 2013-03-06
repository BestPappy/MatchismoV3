//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Pappy on 2/4/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "CardMatchingGame.h"

@implementation CardMatchingGame

#define FLIP_COST 1
#define RANK_MATCH_BONUS 2
#define SUIT_MATCH_BONUS 4
#define MISMATCH_PENALTY -2

// Override the abstract version of the method contained in CardGame
// for the PlayingCard matching game.
- (MatchResult *)flipCardAtIndex:(NSUInteger)index {
    
    MatchResult *matchResult = nil;
    
    Card *crd = [self cardAtIndex:index];
    
    // The card we're flipping better be a PlayingCard or else there's a problem...
    if (![crd isKindOfClass:[PlayingCard class]]) return nil;
    
    // If we get this far, then we know we have the right kind of card...
    PlayingCard *card = (PlayingCard *) crd;
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {   //if card already faceUp, it will just be flipped face down in code below...
            
            // Look thru all cards for another that is already faceUp (and still playable)...
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    
                    // If we get here, then we found another card to test for a match...
                    matchResult = [card matchWithScoringValues:@[otherCard]
                                               rankMatchPoints:RANK_MATCH_BONUS
                                               suitMatchPoints:SUIT_MATCH_BONUS
                                               mismatchPenalty:MISMATCH_PENALTY];

                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
    
    return matchResult;

}

@end
