//
//  Grid.m
//  GameOfLife
//
//  Created by William Short on 10/31/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

//these variables can't be changed
static const int GRID_ROWS = 8;
static const int GRID_COLUMNS = 10;

@implementation Grid {

NSMutableArray *_gridArray;
float _cellWidth;
float _cellHeight;
}

-(void) onEnter {
    [super onEnter];
    
    [self setupGrid];
    
    //accept user interaction
    self.userInteractionEnabled = YES;
}

-(void) setupGrid {
    //divide by grid columns and rows to get correct cell width/height
    _cellWidth = self.contentSize.width / GRID_COLUMNS;
    _cellHeight = self.contentSize.height /GRID_ROWS;
    
    float x = 0;
    float y = 0;
    
    //initialize as blank NSMutableArray
    _gridArray = [NSMutableArray array];
    
    //initialize creatures
    for (int i = 0; i<GRID_ROWS; ++i) {
        //this is how you create 2 dimensional arrays
        _gridArray[i] = [NSMutableArray array];
        x = 0;
        
        for (int j = 0; j<GRID_COLUMNS; ++j) {
            Creature *creature = [[Creature alloc]initCreature];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x, y);
            [self addChild:creature];
            
            //shorthand for accessing an array in an array
            _gridArray[i][j] = creature;
            
            x += _cellWidth;
        }
        y += _cellHeight;
    }
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    //get x,y coords of the touch
    CGPoint touchLocation = [touch locationInNode:self];
    
    //get creature at the location
    Creature *creature = [self creatureForTouchPosition: touchLocation];
    
    //invert creature's state
    creature.isAlive = !creature.isAlive;
}

-(Creature*)creatureForTouchPosition:(CGPoint)touchPosition {
    //get row and column touched, return creature in that cell
    int row = 0;
    int column = 0;
    
    row  = touchPosition.y / _cellHeight;
    column = touchPosition.x / _cellWidth;
    
    return _gridArray[row][column];
}

@end
