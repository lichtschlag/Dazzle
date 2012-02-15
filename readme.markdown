Dazzle
======
Created by Leonhard Lichtschlag (leonhard@lichtschlag.net) on 9/Feb/12.  
Copyright (c) 2012 Leonhard Lichtschlag. All rights reserved.

---

Dazzle is a demo of some effects one can do with Core Animation in iOS 5 
with the CAEmitterCell and CAEmitterLayer classes:

*	The "info" tab shows a linear emitter with a shadow applied to all cells 
	to create an emboss effect.
*	In the "hearts" tab the emitters are triggered by an animation to create 
	the "burst" animation.
*	In the "fire" tab, additive overlaying of cell creates a somewhat realistic 
	impression of fire. The source code here has been adapted from the 
	corresponding Apple sample code for Mac.
*	In the fourth tab, I show how emitted cells can in turn again emit cells:
	the triangles sent away from the touch send two kinds of cells sideways 
	and back to the touch location. The emitted cells start with their 
	visual values set to those of their parents.
*	Emitters can also be invisible, but there seems to be a bug in 
	CAEmitterLayer: setting the birthrate lower than 1.0 creates huge spawn rates
	even though it should be less. To still create the fireworks with it, the 
	explosion can therefore only happen at most 1 sec after the rocket launches. 

Performance-wise, setting the flame height to maximum will really stress the 
iPhone4's graphics to its max, resulting at about ~30 fps. Likewise a constant 
triggering of new touches in the last tab will average at about 22 fps.