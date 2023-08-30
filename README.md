# Friday Night Funkin' - Bloxi (Psych) Engine
Engine originally used on [Mind Games Mod](https://gamebanana.com/mods/301107) and mostly used by bloxifilms for his mods now. intended to be a fix for the vanilla version's many issues while keeping the casual play aspect of it. Also aiming to be an easier alternative to newbie coders.

## Installation:
You must have [Haxe version 4.2.5](https://haxe.org/download/version/4.2.5/), seriously, stop using older or newer versions, it won't work!

open up a Command Prompt/PowerShell or Terminal, type `haxelib install hmm`

after it finishes, simply type `haxelib run hmm install` in order to install all the needed libraries for *Psych Engine!*

If the compiler gives an error saying that hxCodec cannot be found read this issue to fix it: ShadowMario/FNF-PsychEngine#12770

## Customization:

if you wish to disable things like *Lua Scripts* or *Video Cutscenes*, you can read over to `Project.xml`

inside `Project.xml`, you will find several variables to customize Psych Engine to your liking

to start you off, disabling Videos should be simple, simply Delete the line `"VIDEOS_ALLOWED"` or comment it out by wrapping the line in XML-like comments, like this `<!-- YOUR_LINE_HERE -->`

same goes for *Lua Scripts*, comment out or delete the line with `LUA_ALLOWED`, this and other customization options are all available within the `Project.xml` file

## Credits:
* Shadow Mario - Programmer
* RiverOaken - Artist
* Yoshubs - Assistant Programmer
* Krafti - Bloxifilms Artist

### Special Thanks
* bbpanzu - Ex-Programmer
* Yoshubs - New Input System
* SqirraRNG - Crash Handler and Base code for Chart Editor's Waveform
* KadeDev - Fixed some cool stuff on Chart Editor and other PRs
* iFlicky - Composer of Psync and Tea Time, also made the Dialogue Sounds
* PolybiusProxy - .MP4 Video Loader Library (hxCodec)
* Keoiki - Note Splash Animations
* Smokey - Sprite Atlas Support
* Nebula the Zorua - LUA JIT Fork and some Lua reworks

