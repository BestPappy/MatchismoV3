//
//  Card.h
//  Matchismo
//
//  Created by Pappy on 2/3/13.
//  Copyright (c) 2013 CS193p. All rights reserved.
//
//  Base class for all card objects
//

#import <Foundation/Foundation.h>
#import "MatchResult.h"

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isFaceUp) BOOL faceUp;

@property (nonatomic, getter=isUnplayable) BOOL unplayable;

- (MatchResult *) match:(NSArray *)otherCards;

@end
