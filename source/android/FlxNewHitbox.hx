package android;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import openfl.display.BitmapData;
import openfl.display.Shape;
import android.flixel.FlxButton;

/**
 * A zone with 4 hint's (A hitbox). → not now
 * It's really easy to customize the layout.
 *
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
 
 /*
    space/shift extend made by NF|beihu (北狐丶逐梦)
    youtube: https://b23.tv/SnqG443
    bilbil: https://youtube.com/@beihu235?si=NHnWxcUWPS46EqUt
    discord: beihu235
    
    you can use it but must give me credit(dont forget my icon)
    
    space use keyPressed('space') or getPropertyFromClass('flixel.FlxG','keys.pressed.SPACE') in funkinLua
    shift use getPropertyFromClass('flixel.FlxG','keys.pressed.SHIFT') in funkinLua
*/

class FlxNewHitbox extends FlxSpriteGroup
{
	public var buttonLeft:FlxButton = new FlxButton(0, 0);
	public var buttonDown:FlxButton = new FlxButton(0, 0);
	public var buttonUp:FlxButton = new FlxButton(0, 0);
	public var buttonRight:FlxButton = new FlxButton(0, 0);
    
    public var buttonSpace:FlxButton = new FlxButton(0, 0);
    public var buttonShift:FlxButton = new FlxButton(0, 0);
    public var buttonExtend1:FlxButton = new FlxButton(0, 0);
    public var buttonExtend2:FlxButton = new FlxButton(0, 0);
    public var buttonExtend3:FlxButton = new FlxButton(0, 0);
    public var buttonExtend4:FlxButton = new FlxButton(0, 0);
	/**
	 * Create the zone.
	 */
	public function new():Void
	{
		super();
        if (!ClientPrefs.data.spaceExtend && !ClientPrefs.data.shiftExtend){
            add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 4), Std.int(FlxG.height * 1), 0xFF00FF));
		    add(buttonDown = createHint(FlxG.width / 4, 0, Std.int(FlxG.width / 4), Std.int(FlxG.height * 1), 0x00FFFF));
		    add(buttonUp = createHint(FlxG.width / 2, 0, Std.int(FlxG.width / 4), Std.int(FlxG.height * 1), 0x00FF00));
		    add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), 0, Std.int(FlxG.width / 4), Std.int(FlxG.height * 1), 0xFF0000));
        }
        else{
            if (ClientPrefs.data.hitboxLocation == 'Bottom'){
        
		        add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 4), Std.int(FlxG.height * 0.8), 0xFF00FF));
		        add(buttonDown = createHint(FlxG.width / 4, 0, Std.int(FlxG.width / 4), Std.int(FlxG.height * 0.8), 0x00FFFF));
		        add(buttonUp = createHint(FlxG.width / 2, 0, Std.int(FlxG.width / 4), Std.int(FlxG.height * 0.8), 0x00FF00));
		        add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), 0, Std.int(FlxG.width / 4), Std.int(FlxG.height * 0.8), 0xFF0000));

		        if (ClientPrefs.data.spaceExtend && !ClientPrefs.data.shiftExtend)
                    add(buttonSpace = createHint(0, (FlxG.height / 5) * 4, FlxG.width, Std.int(FlxG.height / 5), 0xFFFF00));
		        else if (!ClientPrefs.data.spaceExtend && ClientPrefs.data.shiftExtend)
                    add(buttonShift = createHint(0, (FlxG.height / 5) * 4, FlxG.width, Std.int(FlxG.height / 5), 0xFF0000));
                else if (ClientPrefs.data.spaceExtend && ClientPrefs.data.shiftExtend){    
                    add(buttonShift = createHint(0, (FlxG.height / 5) * 4, Std.int(FlxG.width / 2), Std.int(FlxG.height / 5), 0xFF0000));
                    add(buttonSpace = createHint(FlxG.width / 2, (FlxG.height / 5) * 4, Std.int(FlxG.width / 2), Std.int(FlxG.height / 5), 0xFFFF00));
                }
		    }
		    else if (ClientPrefs.data.hitboxLocation == 'Top'){
		        add(buttonLeft = createHint(0, (FlxG.height / 5) * 1, Std.int(FlxG.width / 4), Std.int(FlxG.height * 0.8), 0xFF00FF));
		        add(buttonDown = createHint(FlxG.width / 4, (FlxG.height / 5) * 1, Std.int(FlxG.width / 4), Std.int(FlxG.height * 0.8), 0x00FFFF));
		        add(buttonUp = createHint(FlxG.width / 2, (FlxG.height / 5) * 1, Std.int(FlxG.width / 4), Std.int(FlxG.height * 0.8), 0x00FF00));
		        add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), (FlxG.height / 5) * 1, Std.int(FlxG.width / 4), Std.int(FlxG.height * 0.8), 0xFF0000));
 
                if (ClientPrefs.data.spaceExtend && !ClientPrefs.data.shiftExtend)
                    add(buttonSpace = createHint(0, 0, FlxG.width, Std.int(FlxG.height / 5), 0xFFFF00));
		        else if (!ClientPrefs.data.spaceExtend && ClientPrefs.data.shiftExtend)
                    add(buttonShift = createHint(0, 0, FlxG.width, Std.int(FlxG.height / 5), 0xFF0000));
                else if (ClientPrefs.data.spaceExtend && ClientPrefs.data.shiftExtend){
                    add(buttonShift = createHint(0, 0, Std.int(FlxG.width / 2), Std.int(FlxG.height / 5), 0xFF0000));
                    add(buttonSpace = createHint(FlxG.width / 2, 0, Std.int(FlxG.width / 2), Std.int(FlxG.height / 5), 0xFFFF00));		    
		        }
		    }
		    
		    else{ //middle
		        add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 5), Std.int(FlxG.height * 1), 0xFF00FF));
		        add(buttonDown = createHint(FlxG.width / 5 * 1, 0, Std.int(FlxG.width / 5), Std.int(FlxG.height * 1), 0x00FFFF));
		        add(buttonUp = createHint(FlxG.width / 5 * 3, 0, Std.int(FlxG.width / 5), Std.int(FlxG.height * 1), 0x00FF00));
		        add(buttonRight = createHint(FlxG.width / 5 * 4 , 0, Std.int(FlxG.width / 5), Std.int(FlxG.height * 1), 0xFF0000));

                if (ClientPrefs.data.spaceExtend && !ClientPrefs.data.shiftExtend)
                    add(buttonSpace = createHint(FlxG.width / 5 * 2, 0, Std.int(FlxG.width / 5), Std.int(FlxG.height * 1), 0xFFFF00));
		        else if (!ClientPrefs.data.spaceExtend && ClientPrefs.data.shiftExtend)
                    add(buttonShift = createHint(FlxG.width / 5 * 2, 0, Std.int(FlxG.width / 5), Std.int(FlxG.height * 1), 0xFF0000));
                else if (ClientPrefs.data.spaceExtend && ClientPrefs.data.shiftExtend){
                    add(buttonShift = createHint(FlxG.width / 5 * 2, 0, Std.int(FlxG.width / 5), Std.int(FlxG.height * 0.5), 0xFF0000));
                    add(buttonSpace = createHint(FlxG.width / 5 * 2, FlxG.height / 2, Std.int(FlxG.width / 5), Std.int(FlxG.height * 0.5), 0xFFFF00));	    
		        }
		    }
		}
		
		scrollFactor.set();
	}

	/**
	 * Clean up memory.
	 */
	override function destroy():Void
	{
		super.destroy();

		buttonLeft = null;
		buttonDown = null;
		buttonUp = null;
		buttonRight = null;
		
		buttonSpace = null;
	}

	private function createHintGraphic(Width:Int, Height:Int, Color:Int = 0xFFFFFF):BitmapData
	{
		var shape:Shape = new Shape();
		shape.graphics.beginFill(Color);
		shape.graphics.lineStyle(10, Color, 1);
		shape.graphics.drawRect(0, 0, Width, Height);
		shape.graphics.endFill();

		var bitmap:BitmapData = new BitmapData(Width, Height, true, 0);
		bitmap.draw(shape);
		return bitmap;
	}

	private function createHint(X:Float, Y:Float, Width:Int, Height:Int, Color:Int = 0xFFFFFF):FlxButton
	{
		var hint:FlxButton = new FlxButton(X, Y);
		hint.loadGraphic(createHintGraphic(Width, Height, Color));
		hint.solid = false;
		hint.immovable = true;
		hint.scrollFactor.set();
		hint.alpha = 0.00001;
		hint.onDown.callback = hint.onOver.callback = function()
		{
			if (hint.alpha != ClientPrefs.data.hitboxalpha)
				hint.alpha = ClientPrefs.data.hitboxalpha;
		}
		hint.onUp.callback = hint.onOut.callback = function()
		{
			if (hint.alpha != 0.00001)
				hint.alpha = 0.00001;
		}
		#if FLX_DEBUG
		hint.ignoreDrawDebug = true;
		#end
		return hint;
	}
}
