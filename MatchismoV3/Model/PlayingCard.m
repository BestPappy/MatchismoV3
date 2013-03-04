//
//  PlayingCard.m
//  Matchismo
//
//  Created by Pappy on 2/3/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// Default values to be used only if corresponding properties are zero.
#define RANK_MATCH_POINTS 1;
#define SUIT_MATCH_POINTS 4;
#define MISMATCH_PENALTY -1;

// Returns a string containing our rank string concatenated with our suit string
- (NSString *)contents
{
    return [[self rankAsString] stringByAppendingString:self.suitAsString];
}

// See if we match rank or suit with 1 or more other PlayingCards
- (MatchResult *) match:(NSArray *)otherCards {
    
    // make a MatchResult object that will be passed back to caller.
    MatchResult *result = [[MatchResult alloc] init];
    
    // Loop thru each object in the array passed to us
    for (id card in otherCards) {
        
        // If the object is a "PlayingCard", then we can do our thing...
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *) card;

            // First, turn on indicator showing we did something
            result.matchWasTested = YES;
            
            // Save the card we're testing against
            [result.cardsTested addObject:otherCard];
            
            // Now look for matching attributes and award points or penalty as appropriate
            if (otherCard.suit == self.suit) {
                result.pointsAwarded += (self.suitMatchPoints) ? self.suitMatchPoints : SUIT_MATCH_POINTS;
            } else if (otherCard.rank == self.rank) {
                result.pointsAwarded += (self.rankMatchPoints) ? self.rankMatchPoints : RANK_MATCH_POINTS;
            } else {
                result.pointsAwarded += (self.mismatchPenalty) ? self.mismatchPenalty : MISMATCH_PENALTY;
            }

        }
        
    }
    
    // If we found any cards to test...
    if (result.matchWasTested) {
        // add ourself to the list tested...
        [result.cardsTested addObject:self];
    }
    
    return result;
}

// Convenience method allowing caller to pass award/penalty values and call "match" method at the same time.
- (MatchResult *) matchWithScoringValues:(NSArray *)otherCards
                         rankMatchPoints:(NSInteger)rmp
                         suitMatchPoints:(NSInteger)smp
                         mismatchPenalty:(NSInteger)mmp {
    self.rankMatchPoints = rmp;
    self.suitMatchPoints = smp;
    self.mismatchPenalty = mmp;
    return [self match:otherCards];
}

// Class method for obtaining an array of the special characters corresponding to each suit value
+ (NSArray *) validSuits {
    return @[@"♠", @"♣", @"♥", @"♦"];
}

// Class method to get an array of the string value corresponding to each rank value
+ (NSArray *) validRanks {
    return @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

// Suit must be > zero and <= number of valid suits
- (void)setSuit:(NSUInteger)suit {
    if (suit > 0 && (suit <= [PlayingCard validSuits].count)) {
        _suit = suit;
    }
}

// Rank must be > zero and <= number of valid ranks
- (void)setRank:(NSUInteger)rank {
    if (rank > 0 && (rank <= [PlayingCard validRanks].count)) {
        _rank = rank;
    }
}

// Instance method to convert our suit into one of the "validSuits".
- (NSString *)suitAsString {
    if (self.suit) {
        return [PlayingCard validSuits] [self.suit - 1];
    }
    return @"?";
}

// Instance method to convert our rank into one of the "validRanks".
- (NSString *)rankAsString {
    if (self.rank) {
        return [PlayingCard validRanks] [self.rank - 1];
    }
    return @"?";
}

@end
