// -------------------------
// Dazzle
// ------------------------- 
//
// Created by Leonhard Lichtschlag (leonhard@lichtschlag.net) on 9/Feb/12.
// Copyright (c) 2012 Leonhard Lichtschlag. All rights reserved.

Dazzle is a demo of some effects one can do with Core Animation in iOS 5 
with the CAEmitterCell and CAEmitterLayer classes:

*	The "info" tab shows a liniear emmitter with a shadow applied to all cells 
	to create an emboss effect.
*	In the "hearts" tab the emitters are triggered by an animation to create 
	the "burst" animation.
*	In the "fire" tab, additive overlaying of cell creates a somehwat realistic 
	impression of fire. The source code here has been adapted from the 
	corresponding Apple sample code for Mac.
*	In the last tab, I show how emitted cells can in turn again emitt cells:
	the triangles sent away from the touch send two kinds of cells sindways 
	and back to the touch location. The emitted cells start with their 
	visual values set to those of their parents.

Performancewise, setting the flame height to maximum will really stress the 
iPhone4's graphics to its max, resulting at about ~30 fps. Likewise a constant 
triggering of new touches in the last tab will average at about 22 fps.