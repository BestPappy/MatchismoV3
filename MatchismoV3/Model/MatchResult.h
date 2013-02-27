//
//  MatchResult.h
//  MatchismoV3
//
//  Created by Ron Cain on 2/26/13.
//  Copyright (c) 2013 Ron Cain. All rights reserved.
//
//  A "helper" class used by Card objects to return results of a test for matching cards.
//

#import <Foundation/Foundation.h>

@interface MatchResult : NSObject

// Indicates whether conditions warranted a test for match
@property (nonatomic) BOOL matchWasTested;

// If a match was tested, the number of points awarded or penalized
@property (nonatomic) NSInteger pointsAwarded;

// If a match was tested, these are ALL the cards tested for match
@property (strong, nonatomic) NSMutableArray *cardsTested;

@end
