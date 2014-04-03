//
//  IntroLayer.m
//  Cukerview
//
//  Created by pmpod on 24.05.2013.
//  Copyright pmpod 2013. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "LoadingScene.h"
#import "GameConfig.h"
#import "HelloWorldScene.h"

#pragma mark - IntroLayer

// IntroLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the IntroLayer as the only child.
+(CCScene *) scene
{
    CCLOG(@"===========================================");
	CCLOG(@"LOG %@: %@", NSStringFromSelector(_cmd), self);
    CCLOG(@"===========================================");
    
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
    [scene addChild:layer z:0 name:@"introLayer"];
	
	// return the scene
	return scene;
}

// Inicjalizator
-(id) init
{
	if( (self=[super init]))
    {
        CCLOG(@"LOG %@: %@", NSStringFromSelector(_cmd),self);

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] viewSize];

		CCSprite *background;
		
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone )
			background = [CCSprite spriteWithImageNamed:@"Default.png"];
        else
			background = [CCSprite spriteWithImageNamed:@"Default-landscape~ipad.png"];
		background.position = ccp(size.width/2, size.height/2);

		// add the label as a child to this Layer
		[self addChild: background];
	}
    else return(nil);
    
	return self;
}

-(void) dealloc
{
    CCLOG(@"LOG %@: %@", NSStringFromSelector(_cmd),self);
}

-(void) onEnter
{
	[super onEnter];
	[[CCDirector sharedDirector] replaceScene:[LoadingScene sceneWithTargetScene:(HelloWorldSceneTag)] withTransition:[CCTransition transitionCrossFadeWithDuration:1.0]];
}

-(void) onEnterTransitionDidFinish
{
	CCLOG(@"LOG %@: %@", NSStringFromSelector(_cmd), self);
	[super onEnterTransitionDidFinish];
}

-(void) onExit
{
	CCLOG(@"LOG %@: %@", NSStringFromSelector(_cmd), self);
    
    //remove all textures to free up additional memory. Textures get retained even if the sprite gets released (it doesn't show as a leak). big memory saver
    
    //#ifdef REMOVE_ALL_TEXTURES
    //    [self unscheduleAllSelectors];
     //   [[CCTextureCache sharedTextureCache] removeAllTextures];
    //#endif
	// must call super here:
	[super onExit];
}

-(void) onExitTransitionDidStart
{
	CCLOG(@"LOG %@: %@", NSStringFromSelector(_cmd), self);
	
	// must call super here:
	[super onExitTransitionDidStart];
}
@end
