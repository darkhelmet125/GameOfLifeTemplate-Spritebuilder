//
//  Creature.m
//  GameOfLife
//
//  Created by William Short on 10/31/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Creature.h"

@implementation Creature

-(instancetype) initCreature {
    //calling super refers to CCSprite because Creature class inherits from CCSprite
    self = [super initWithImageNamed:@"GameOfLifeAssets/Assets/bubble.png"];
    
    if(self) {
        self.isAlive = NO;
    }
    
    return self;
}

-(void) setIsAlive:(BOOL)newState {
    //using an @property automatically creates a variable with a leading underscore
    _isAlive = newState;
    
    self.visible = _isAlive;
}

@end
