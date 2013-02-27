//
//  Card.m
//  Matchismo
//
//  Created by Pappy on 2/3/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//

#import "Card.h"

@implementation Card

// A basic implementation of "match", intended to be overidden by subclasses.
-(MatchResult *) match:(NSArray *)otherCards
{
    if (otherCards) {
        MatchResult *result = [[MatchResult alloc] init];
        result.matchWasTested = YES;
        
        [result.cardsTested addObject:self];
        
        for (Card *card in otherCards) {
            [result.cardsTested addObject:card];
            if ([card.contents isEqualToString:self.contents]) {
                result.pointsAwarded += 1;
            } else {
                result.pointsAwarded -= 1;
            }
        }
        
        return result;
        
    } else {
        return nil; // if we were passed nil, we just return nil
    }
}

@end
