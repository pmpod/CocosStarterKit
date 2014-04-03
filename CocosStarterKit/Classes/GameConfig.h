/*
 * Game Config file
 * copyright (c) 2013 Mechanuts
 *
 */



#ifndef __GAME_CONFIG_H
#define __GAME_CONFIG_H


#define DISPLAY_STATS YES
#define ENABLE_RETINA_DISPLAY YES
#define PERSERVE_BACKBUFFER NO
#define REMOVE_ALL_TEXTURES YES
#define TRZYDPROJECTION YES
//#define TRZYDPROJECTION YES

enum {
	kTagLabel = 1,
	kTagMagnifier,
	kTagLabel3,
} GameTags;

enum {
	aTagHero = 1,
} AnimationTags;

enum {
	kLayerBack = 1,
	kLayer1,
	kLayerFront,
	kLayerRobociki,
	kLayerZoliborz,
	kLayerZoliborzEye,
	kLayerMagnifierFrame,
	kLayerDebugLines,
	kLayerPauseLayer1,
	kLayerPauseLayer2
} LayerOrder;

static float tapRadius = 64.0f;

#endif // __GAME_CONFIG_H

