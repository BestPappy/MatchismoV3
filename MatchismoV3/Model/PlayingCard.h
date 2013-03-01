//
//  PlayingCard.h
//  Matchismo
//
//  Created by Pappy on 2/3/13.
//  Modified 2/28/13 for HW3 by RLC.
//

#import "Card.h"

@interface PlayingCard : Card

// Playing cards have a "suit" value.
// 1=Spade, 2=Club, 3=Heart, 4=Diamond
// See suitAsString below...
// See validSuits below...
@property (nonatomic) NSUInteger suit;

// Playing cards have a "rank" value:
// 1=Ace, 2=2, 3=3, ... 10=10, 11=Jack, 12=Queen, 13=King
// See rankAsString below...
@property (nonatomic) NSUInteger rank;

// If these properties are zero, then constants defined in implementation will be used.
@property (nonatomic) int rankMatchPoints;
@property (nonatomic) int suitMatchPoints;
@property (nonatomic) int mismatchPenalty;

// Instance method to convert our suit into one of the "validSuits".
- (NSString *) suitAsString;

// Instance method to convert our rank into one of the "validRanks".
- (NSString *) rankAsString;

// Convience method allowing caller to set values awarded or penalized which override the defailts
- (MatchResult *) matchWithScoringValues:(NSArray *)otherCards
                         rankMatchPoints:(NSInteger)rmp
                         suitMatchPoints:(NSInteger)smp
                         mismatchPenalty:(NSInteger)mmp;

// A class method that just returns an array containing the
// 4 special characters representing the suits
+ (NSArray *) validSuits;

// A class method that just returns an array containing the
// 13 strings used to represent our rank as a string.
+ (NSArray *) validRanks;

@end
