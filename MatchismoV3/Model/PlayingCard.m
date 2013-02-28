//
//  PlayingCard.m
//  Matchismo
//
//  Created by Pappy on 2/3/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

#define RANK_MATCH_POINTS 1;
#define SUIT_MATCH_POINTS 4;

- (NSString *)contents
{
    return [[self rankAsString] stringByAppendingString:self.suitAsString];
}

- (MatchResult *) match:(NSArray *)otherCards {
    
    MatchResult *result = [[MatchResult alloc] init];
    
    for (id card in otherCards) {
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *) card;
            result.matchWasTested = YES;
            [result.cardsTested addObject:otherCard];
            [result.cardsTested addObject:self];
            if (otherCard.suit == self.suit) {
                result.pointsAwarded += RANK_MATCH_POINTS;
            } else if (otherCard.rank == self.rank) {
                result.pointsAwarded += SUIT_MATCH_POINTS;
            }
        }
    }
    
    return result;
}


+ (NSArray *) validSuits {
    return @[@"♠", @"♣", @"♥", @"♦"];
}

+ (NSArray *) validRanks {
    return @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}


- (void)setSuit:(NSUInteger)suit {
    if (suit > 0 && (suit <= [PlayingCard validSuits].count)) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank {
    if (rank > 0 && (rank <= [PlayingCard validRanks].count)) {
        _rank = rank;
    }
}

- (NSString *)suitAsString {
    if (!self.suit) {
        return [PlayingCard validSuits] [self.suit - 1];
    }
    return @"?";
}

- (NSString *)rankAsString {
    if (!self.rank) {
        return [PlayingCard validRanks] [self.rank - 1];
    }
    return @"?";
}



@end
