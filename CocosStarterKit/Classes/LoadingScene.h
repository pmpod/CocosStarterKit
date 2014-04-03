//
//  LoadingScene.h
//  Cukerview
//
//  Created by pmpod on 24.05.2013.
//  Copyright 2013 pmpod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum
{
	TargetSceneINVALID = 0,
    HelloWorldSceneTag,
	MenuScene,
	GameScene,
    IntroScene,
    AboutScene,
    EmptyScene,
	TargetSceneMAX,
} TargetSceneTypes;


@interface LoadingScene : CCScene
{
	TargetSceneTypes targetScene;
    CCSprite *star_idle;
	CCSprite *star_glow;
    CCActionRepeatForever* repeat;
}

+(id) sceneWithTargetScene:(TargetSceneTypes)sceneType;
-(id) initWithTargetScene:(TargetSceneTypes)sceneType;
@end
