//
//  MatchResult.m
//  MatchismoV3
//
//  Created by Ron Cain on 2/26/13.
//  Copyright (c) 2013 Ron Cain. All rights reserved.
//

#import "MatchResult.h"

@implementation MatchResult

- (NSMutableArray *) cardsTested {
    
    // Do lazy instantiation if needed.
    if (!_cardsTested) {
        _cardsTested = [[NSMutableArray alloc] init];
    }
    
    return _cardsTested;
}

@end
