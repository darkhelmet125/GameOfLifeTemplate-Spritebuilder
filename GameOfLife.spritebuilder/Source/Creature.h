//
//  Creature.h
//  GameOfLife
//
//  Created by William Short on 10/31/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Creature : CCSprite

//stores the current state of the creature
@property (nonatomic, assign) BOOL isAlive;

//store the amount of living neighbors
@property (nonatomic, assign) NSInteger livingNeighbors;

-(id) initCreature;

@end
