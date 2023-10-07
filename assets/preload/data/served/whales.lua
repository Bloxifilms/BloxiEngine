-- Whales (Stop fucking asking me now jesus)
function onCreate()
	makeAnimatedLuaSprite('whale','mcm/stages/served/platform/whale', -4000, 50)
	addAnimationByPrefix('whale','body', 'body', 24, true)
	addLuaSprite('whale', false);
	setProperty('whale.visible', false);
	
	makeAnimatedLuaSprite('whale2','mcm/stages/served/platform/whale', -4000, 200)
	addAnimationByPrefix('whale2','body', 'body', 24, true)
	addLuaSprite('whale2', false);
	setProperty('whale2.visible', false);

	makeAnimatedLuaSprite('whale3','mcm/stages/served/platform/whale', -4000, 400)
	addAnimationByPrefix('whale3','body', 'body', 24, true)
	addLuaSprite('whale3', false);
	setProperty('whale3.visible', false);
	
	makeAnimatedLuaSprite('whale4','mcm/stages/served/platform/whale', -4000, 300)
	addAnimationByPrefix('whale4','body', 'body', 24, true)
	addLuaSprite('whale4', false);
	setProperty('whale4.visible', false);
	
	makeAnimatedLuaSprite('whale5','mcm/stages/served/platform/whale', -4000, 100)
	addAnimationByPrefix('whale5','body', 'body', 24, true)
	addLuaSprite('whale5', false);
	setProperty('whale5.visible', false);
	
	makeAnimatedLuaSprite('whale6','mcm/stages/served/platform/whale', -4000, 100)
	addAnimationByPrefix('whale6','body', 'body', 24, true)
	addLuaSprite('whale6', false);
	setProperty('whale6.visible', false);
end
--  Points where the whales appear
function onStepHit()
	if curStep == 1968 then
	setProperty('whale.visible', true);
	doTweenX('showup','whale', 8000, 10, 'cubeOut')
	end
	if curStep == 2000 then
	setProperty('whale2.visible', true);
	doTweenX('showup','whale2', 8000, 5, 'cubeOut')
	end
	if curStep == 2020 then
	setProperty('whale3.visible', true);
	doTweenX('showup','whale3', 8000, 7, 'cubeOut')
	end
	if curStep == 2056 then
	setProperty('whale6.visible', true);
	doTweenX('showup','whale6', 8000, 9, 'cubeOut')
	end
	if curStep == 2096 then
	setProperty('whale4.visible', true);
	doTweenX('showup','whale4', 4000, 15, 'cubeOut')
	end
	if curStep == 2192 then
	setProperty('whale5.visible', true);
	doTweenX('showup','whale2', 4000, 3, 'cubeOut')
	end
end