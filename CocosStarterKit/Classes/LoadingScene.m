//
//  LoadingScene.m
//  Cukerview
//
//  Created by pmpod on 24.05.2013.
//  Copyright 2013 pmpod. All rights reserved.
//

#import "LoadingScene.h"
#import "EmptyLayer.h"
#import "IntroLayer.h"
#import "HelloWorldScene.h"
#import "GameConfig.h"


@interface LoadingScene (PrivateMethods)
-(void) loadScene:(CCTime)delta;
@end

@implementation LoadingScene

+(id) sceneWithTargetScene:(TargetSceneTypes)sceneType;
{
	NSLog(@"===========================================");
	NSLog(@"%@: %@", NSStringFromSelector(_cmd), self);
	// This creates an autorelease object of self.
	// In class methods self refers to the current class and in this case is equivalent to LoadingScene.
	return [[self alloc] initWithTargetScene:sceneType];
}

-(id) initWithTargetScene:(TargetSceneTypes)sceneType
{
	if ((self = [super init]))
	{
		targetScene = sceneType;
        

        star_idle = [CCSprite spriteWithImageNamed:@"Icon.png"];
        star_glow = [CCSprite spriteWithImageNamed:@"Icon-72.png"];
		CGSize size = [[CCDirector sharedDirector] viewSize];
        
        star_idle.position = CGPointMake(size.width / 2, size.height / 2);
        star_glow.position = CGPointMake(size.width / 2, size.height / 2);
        
		[self addChild:star_idle];
		[self addChild:star_glow];
        
        
        star_glow.opacity = 0;


	}
	
	return self;
}

-(void) onEnterTransitionDidFinish
{
	[super onEnter];
    
    id action1 = [CCActionFadeIn actionWithDuration:1.0f];
    id action2 = [CCActionInterval actionWithDuration:0.1f];
    CCActionEaseInOut *easeAction = [CCActionEaseInOut actionWithAction:action1 rate:4];
    id easeBack = [easeAction reverse];
    
    
    CCActionSequence* sequence = [CCActionSequence actions:  action2, easeAction, easeBack,nil];
    repeat =[CCActionRepeatForever actionWithAction:sequence];
    [star_glow runAction: repeat];
    [self scheduleOnce:@selector(loadScene:) delay:1.0f];
}

-(void) onExit
{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    
    //#ifdef REMOVE_ALL_TEXTURES
        [self unscheduleAllSelectors];
        //[[CCTextureCache sharedTextureCache] removeAllTextures];
    //#endif
	// must call super here:
	[super onExit];
}

-(void) loadScene:(CCTime)delta
{
	// Decide which scene to load based on the TargetScenes enum.
	// You could also use TargetScene to load the same with using a variety of transitions.
	switch (targetScene)
	{
		case HelloWorldSceneTag:
			[[CCDirector sharedDirector] replaceScene:[HelloWorldScene scene] withTransition:[CCTransition transitionFadeWithDuration:1.0 ]];
			break;
//		case AboutScene:
//			[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[AboutLayer scene] ]];
//			break;
//		case GameScene:
//			[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameLayer scene] ]];
//			break;
//		case IntroScene:
//			[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[IntroLayer scene] ]];
//			break;
//		case EmptyScene:
//			[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[EmptyLayer scene] ]];
//			break;
			
		default:
			// Always warn if an unspecified enum value was used. It's a reminder for yourself to update the switch
			// whenever you add more enum values.
			NSAssert2(nil, @"%@: unsupported TargetScene %i", NSStringFromSelector(_cmd), targetScene);
			break;
	}
	
	// Tip: example usage of the INVALID and MAX enum values to iterate over all enum values
	//for (TargetSceneTypes i = TargetSceneINVALID + 1; i < TargetSceneMAX; i++)
	//{
	//}
}

-(void) dealloc
{
	NSLog(@"%@: %@", NSStringFromSelector(_cmd), self);
}

@end

