//
//  EmptyLayer.m
//  Cukerview
//
//  Created by pmpod on 30.05.2013.
//  Copyright 2013 pmpod. All rights reserved.
//

#import "EmptyLayer.h"


@implementation EmptyLayer

+(id) scene
{
    CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    CCScene *scene=[CCScene node];
    CCNode* layer=[EmptyLayer node];
    [scene addChild:layer z:0 name:@"1"];
    return scene;
}
// Inicjalizator
-(id) init
{
    if (self= [super init])
    {
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd),self);
    }
    return self;
}

-(void) onEnter{
	[super onEnter];
    //[[CCTextureCache sharedTextureCache] dumpCachedTextureInfo];
}
-(void) dealloc
{
    CCLOG(@"%@: %@", NSStringFromSelector(_cmd),self);
}



@end
