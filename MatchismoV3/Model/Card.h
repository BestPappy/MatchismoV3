//
//  Card.h
//  Matchismo
//
//  Created by Pappy on 2/3/13.
//  Modified 2/28/13 as part of HW3 by RLC.
//
//  Base class for all card objects
//

#import <Foundation/Foundation.h>
#import "MatchResult.h"

@interface Card : NSObject

// A simple string representation of the kind of card we are.
@property (strong, nonatomic) NSString *contents;

// Are we face-up or face-down?
@property (nonatomic, getter=isFaceUp) BOOL faceUp;

// Self explanatory?
@property (nonatomic, getter=isUnplayable) BOOL unplayable;

// The main thing we do is see if we "match" some other card(s) in some way...
- (MatchResult *) match:(NSArray *)otherCards;

@end
