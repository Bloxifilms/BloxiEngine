package substates;

/*
    ResultsScreen made by NF|beihu (北狐丶逐梦)
    youtube: https://b23.tv/SnqG443
    bilbil: https://youtube.com/@beihu235?si=NHnWxcUWPS46EqUt
    discord: beihu235
    
    you can use it but must give me credit(dont forget my icon)
    logic is very easy so I think everyone can understand it
    
    Who cares about rudy's hscript so I continue to choose to use my lua logic
    Her hscript weren't worth stole and I didn't stole it
*/
import flixel.addons.transition.FlxTransitionableState;

import states.PlayState;
import states.FreeplayState;

import backend.Conductor;

import flixel.util.FlxSpriteUtil;
import openfl.display.Sprite;
import openfl.geom.Rectangle;

#if sys
import sys.io.File;
import sys.FileSystem;
#end
import tjson.TJSON as Json;

typedef NoteTypeColorData =
{

	sick:FlxColor,
	good:FlxColor,
    bad:FlxColor,
    shit:FlxColor,
    miss:FlxColor
    
}


class ResultsScreen extends MusicBeatSubstate
{
	public var background:FlxSprite;	
    public var graphBG:FlxSprite;
    public var graphSizeUp:FlxSprite;
	public var graphSizeDown:FlxSprite;
	public var graphSizeLeft:FlxSprite;
	public var graphSizeRight:FlxSprite;
	
	public var graphJudgeCenter:FlxSprite;
	public var graphSickUp:FlxSprite;
	public var graphSickDown:FlxSprite;
	public var graphGoodUp:FlxSprite;
	public var graphGoodDown:FlxSprite;
	public var graphBadUp:FlxSprite;
	public var graphBadDown:FlxSprite;
	public var graphShitUp:FlxSprite;
	public var graphShitDown:FlxSprite;
    public var graphMiss:FlxSprite;
    
    public var clearText:FlxText;
	public var judgeText:FlxText;
	public var setGameText:FlxText;
	public var setMsText:FlxText;
	public var backText:FlxText;
    
    public var NoteTypeColor:NoteTypeColorData;
    
    public var ColorArray:Array<FlxColor> = [];
    public var color:FlxColor;
	public function new(x:Float, y:Float)
	{
		super();
		/*
		if (FileSystem.exists(SUtil.getPath() + 'assets/images/mainmenu_sprite/rsNoteColor.json'))
		NoteTypeColor = Json.parse(SUtil.getPath() + 'assets/images/mainmenu_sprite/rsNoteColor.json');
		else
		NoteTypeColor = Json.parse(Paths.getPath('images/mainmenu_sprite/rsNoteColor.json', TEXT));
		
		ColorArray.push(NoteTypeColor.sick);
		ColorArray.push(NoteTypeColor.good);
		ColorArray.push(NoteTypeColor.bad);
		ColorArray.push(NoteTypeColor.shit);
		ColorArray.push(NoteTypeColor.miss);
		*/
	
				
		ColorArray = [
		0xFF00FFFF,
	    0xFF00FF00,
	    0xFFFF7F00,
	    0xFFFF5858,
	    0xFFFF0000
		];
		
		background = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		background.scrollFactor.set();
		background.alpha = 0;
		add(background);
		
		var graphWidth = 550;
		var graphHeight = 300;
		graphBG = new FlxSprite(FlxG.width - 550 - 50, 50).makeGraphic(550, 300, FlxColor.BLACK);
		graphBG.scrollFactor.set();
		graphBG.alpha = 0;		
		add(graphBG);
		
		var noteSpr = FlxSpriteUtil.flashGfx;		
		var _rect = new Rectangle(0, 0, graphWidth, graphHeight);
		graphBG.pixels.fillRect(_rect, 0xFF000000);
		FlxSpriteUtil.beginDraw(0xFFFFFFFF);
	    
	    var noteSize = 2.3;
	    var MoveSize = 0.6;
		for (i in 0...PlayState.rsNoteTime.length){
		    if (Math.abs(PlayState.rsNoteMs[i]) <= 200) color = ColorArray[4];
		    if (Math.abs(PlayState.rsNoteMs[i]) <= Conductor.safeZoneOffset) color = ColorArray[3];
		    if (Math.abs(PlayState.rsNoteMs[i]) <= ClientPrefs.data.badWindow) color = ColorArray[2];
		    if (Math.abs(PlayState.rsNoteMs[i]) <= ClientPrefs.data.goodWindow) color = ColorArray[1];
		    if (Math.abs(PlayState.rsNoteMs[i]) <= ClientPrefs.data.sickWindow) color = ColorArray[0];
		    FlxSpriteUtil.beginDraw(color);
		    if (Math.abs(PlayState.rsNoteMs[i]) <= 166){
    		noteSpr.drawCircle(graphWidth * (PlayState.rsNoteTime[i] / PlayState.rsSongLength) - noteSize / 2 , graphHeight * 0.5 + graphHeight * 0.5 * MoveSize * (PlayState.rsNoteMs[i] / Conductor.safeZoneOffset) /*- noteSize / 2*/, noteSize);
    		}
    		else{
    		noteSpr.drawCircle(graphWidth * (PlayState.rsNoteTime[i] / PlayState.rsSongLength) - noteSize / 2 , graphHeight * 0.5 + graphHeight * 0.5 * 0.8 /*- noteSize / 2*/, noteSize);		
    		}
    		
		    graphBG.pixels.draw(FlxSpriteUtil.flashGfxSprite);
		}
		
		var judgeHeight = 3;
		graphJudgeCenter = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, FlxColor.WHITE);
		graphJudgeCenter.scrollFactor.set();
		graphJudgeCenter.alpha = 0;		
		add(graphJudgeCenter);
		
		graphSickUp = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 - graphHeight * 0.5 * MoveSize * (ClientPrefs.data.sickWindow / Conductor.safeZoneOffset) - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, ColorArray[0]);
		graphSickUp.scrollFactor.set();
		graphSickUp.alpha = 0;		
		add(graphSickUp);
		
		graphSickDown = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 + graphHeight * 0.5 * MoveSize * (ClientPrefs.data.sickWindow / Conductor.safeZoneOffset) - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, ColorArray[0]);
		graphSickDown.scrollFactor.set();
		graphSickDown.alpha = 0;		
		add(graphSickDown);
		
		graphGoodUp = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 - graphHeight * 0.5 * MoveSize * (ClientPrefs.data.goodWindow / Conductor.safeZoneOffset) - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, ColorArray[1]);
		graphGoodUp.scrollFactor.set();
		graphGoodUp.alpha = 0;		
		add(graphGoodUp);
		
		graphGoodDown = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 + graphHeight * 0.5 * MoveSize * (ClientPrefs.data.goodWindow / Conductor.safeZoneOffset) - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, ColorArray[1]);
		graphGoodDown.scrollFactor.set();
		graphGoodDown.alpha = 0;		
		add(graphGoodDown);
		
		graphBadUp = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 - graphHeight * 0.5 * MoveSize * (ClientPrefs.data.badWindow / Conductor.safeZoneOffset) - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, ColorArray[2]);
		graphBadUp.scrollFactor.set();
		graphBadUp.alpha = 0;		
		add(graphBadUp);
		
		graphBadDown = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 + graphHeight * 0.5 * MoveSize * (ClientPrefs.data.badWindow / Conductor.safeZoneOffset) - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, ColorArray[2]);
		graphBadDown.scrollFactor.set();
		graphBadDown.alpha = 0;		
		add(graphBadDown);
		
		graphShitUp = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 - graphHeight * 0.5 * MoveSize * (Conductor.safeZoneOffset / Conductor.safeZoneOffset) - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, ColorArray[3]);
		graphShitUp.scrollFactor.set();
		graphShitUp.alpha = 0;		
		add(graphShitUp);
		
		graphShitDown = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 + graphHeight * 0.5 * MoveSize * (Conductor.safeZoneOffset / Conductor.safeZoneOffset) - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, ColorArray[3]);
		graphShitDown.scrollFactor.set();
		graphShitDown.alpha = 0;		
		add(graphShitDown);
		
		graphMiss = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 + graphHeight * 0.5 * 0.8 - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, ColorArray[4]);
		graphMiss.scrollFactor.set();
		graphMiss.alpha = 0;		
		add(graphMiss);
		
		graphJudgeCenter = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, FlxColor.WHITE);
		graphJudgeCenter.scrollFactor.set();
		graphJudgeCenter.alpha = 0;		
		add(graphJudgeCenter);
		
		graphJudgeCenter = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, FlxColor.WHITE);
		graphJudgeCenter.scrollFactor.set();
		graphJudgeCenter.alpha = 0;		
		add(graphJudgeCenter);
		
		graphJudgeCenter = new FlxSprite(graphBG.x, graphBG.y + graphHeight * 0.5 - judgeHeight * 0.5).makeGraphic(graphWidth, judgeHeight, FlxColor.WHITE);
		graphJudgeCenter.scrollFactor.set();
		graphJudgeCenter.alpha = 0;		
		add(graphJudgeCenter);
		
		graphSizeUp = new FlxSprite(graphBG.x, graphBG.y - 2).makeGraphic(graphWidth + 2, 2, FlxColor.WHITE);
		graphSizeUp.scrollFactor.set();
		graphSizeUp.alpha = 0;		
		add(graphSizeUp);
		
		graphSizeDown = new FlxSprite(graphBG.x - 2, graphBG.y + graphHeight).makeGraphic(graphWidth + 2, 2, FlxColor.WHITE);
		graphSizeDown.scrollFactor.set();
		graphSizeDown.alpha = 0;		
		add(graphSizeDown);
		
		graphSizeLeft = new FlxSprite(graphBG.x - 2, graphBG.y - 2).makeGraphic(2, graphHeight + 2, FlxColor.WHITE);
		graphSizeLeft.scrollFactor.set();
		graphSizeLeft.alpha = 0;		
		add(graphSizeLeft);
		
		graphSizeRight = new FlxSprite(graphBG.x + graphWidth, graphBG.y).makeGraphic(2, graphHeight + 2, FlxColor.WHITE);
		graphSizeRight.scrollFactor.set();
		graphSizeRight.alpha = 0;		
		add(graphSizeRight);		
		
		//-----------------------BG
		var opponentExtend:String = '';
		if (ClientPrefs.data.playOpponent) opponentExtend = '(Opponent)';
		clearText = new FlxText(20, -155, 0, 'Song Cleared!\n' + PlayState.SONG.song + opponentExtend + ' - ' + Difficulty.getString() + '\n');
		clearText.size = 34;
		clearText.font = Paths.font('vcr.ttf');
		clearText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		clearText.scrollFactor.set();
		clearText.antialiasing = ClientPrefs.data.antialiasing;
		add(clearText);		
	    
	    var ACC = Math.ceil(PlayState.rsACC * 10000) / 100;
		judgeText = new FlxText(-400, 200, 0, 
		'Judgements:\nSicks: ' + PlayState.rsSicks 
		+ '\nGoods: ' + PlayState.rsGoods 
		+ '\nBads: ' + PlayState.rsBads 
		+ '\nShits: ' + PlayState.rsShits 
		+ '\n\nCombe Breaks: ' + PlayState.rsMisses 
		+ '\nHighest Combe: ' + PlayState.highestCombo 
		+ '\nScore: ' + PlayState.rsScore 
		+ '\nAccuracy: ' + ACC + '%'
		+ '\nRank: ' + PlayState.rsRatingName + '(' + PlayState.rsRatingFC + ')\n'
		);
		judgeText.size = 25;
		judgeText.font = Paths.font('vcr.ttf');
		judgeText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		judgeText.scrollFactor.set();
		judgeText.antialiasing = ClientPrefs.data.antialiasing;
		add(judgeText);
		
		var botplay:String = 'Close';
		if (ClientPrefs.getGameplaySetting('botplay')) botplay = 'Open';
		var practice:String = 'Close';

		if (ClientPrefs.getGameplaySetting('practice')) practice = 'Open';

		setGameText = new FlxText(FlxG.width + 400, 420, 0, 
		'healthGain: X' + ClientPrefs.getGameplaySetting('healthgain')
		+ '  healthLoss: X' + ClientPrefs.getGameplaySetting('healthloss')
		+ '\n'
		+ 'SongSpeed: X' + ClientPrefs.getGameplaySetting('scrollspeed')
		+ '  PlaybackRate: X' + ClientPrefs.getGameplaySetting('songspeed')
		+ '\n'
		+ 'BotPlay: ' + botplay
		+ '  PracticeMode: ' + practice
		+ '\n'
		+ 'Finished time: ' + Date.now().toString()
		+ '\n'
		);
		setGameText.size = 25;
		setGameText.alignment = RIGHT;
		setGameText.font = Paths.font('vcr.ttf');
		setGameText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		setGameText.scrollFactor.set();
		setGameText.antialiasing = ClientPrefs.data.antialiasing;
		add(setGameText);
		
		var Main:Float = 0;
		for (i in 0...PlayState.rsNoteTime.length){
		Main = Main + Math.abs(PlayState.rsNoteMs[i]);
		}
		Main = Math.ceil(Main / PlayState.rsNoteTime.length * 100) / 100;
        var safeZoneOffset:Float = Math.ceil(Conductor.safeZoneOffset * 10) / 10;
		setMsText = new FlxText(20, FlxG.height + 150, 0, 
		'Main: ' + Main + 'ms'
		+ '\n'
		+ '('
		+ 'SICK:' + ClientPrefs.data.sickWindow + 'ms,'
		+ 'GOOD:' + ClientPrefs.data.goodWindow + 'ms,'
		+ 'BAD:' + ClientPrefs.data.badWindow + 'ms,'
		+ 'SHIT:' + safeZoneOffset + 'ms'
		+ ')'		
		+ '\n'
		);
		setMsText.size = 16;
		setMsText.font = Paths.font('vcr.ttf');
		setMsText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		setMsText.scrollFactor.set();
		setMsText.antialiasing = ClientPrefs.data.antialiasing;
		add(setMsText);		
		
		var backTextShow:String = 'Press Space to continue';
		#if android backTextShow = 'Press Back to continue'; #end
		backText = new FlxText(0, FlxG.height - 45, 0, backTextShow);
		backText.size = 28;
		backText.font = Paths.font('vcr.ttf');
		backText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1, 1);
		backText.scrollFactor.set();
		backText.antialiasing = ClientPrefs.data.antialiasing;
	    backText.alignment = RIGHT;
		add(backText);		
		backText.alpha = 0;
		backText.x = FlxG.width - backText.width - 20;

		//--------------text
		
		//time = 0
		FlxTween.tween(background, {alpha: 0.5}, 0.5);		
		
		new FlxTimer().start(0.5, function(tmr:FlxTimer){
			FlxTween.tween(clearText, {y: ClientPrefs.data.showFPS ? 60 : 5}, 0.5, {ease: FlxEase.backInOut});
		});
		
		
		new FlxTimer().start(1, function(tmr:FlxTimer){
			FlxTween.tween(setMsText, {y: FlxG.height - 25 * 2}, 0.5, {ease: FlxEase.backInOut});			
		});
		
		new FlxTimer().start(1.5, function(tmr:FlxTimer){
		    FlxTween.tween(judgeText, {x: 20}, 0.5, {ease: FlxEase.backInOut});		
		    FlxTween.tween(setGameText, {x: FlxG.width - setGameText.width - 20}, 0.5, {ease: FlxEase.backInOut});		
		});
		
		new FlxTimer().start(2, function(tmr:FlxTimer){
			FlxTween.tween(graphBG, {alpha: 0.75}, 0.5);
			
			FlxTween.tween(graphJudgeCenter, {alpha: 0.3}, 0.5);	
			FlxTween.tween(graphSickUp, {alpha: 0.3}, 0.5);	
			FlxTween.tween(graphSickDown, {alpha: 0.3}, 0.5);	
			FlxTween.tween(graphGoodUp, {alpha: 0.3}, 0.5);	
			FlxTween.tween(graphGoodDown, {alpha: 0.3}, 0.5);	
			FlxTween.tween(graphBadUp, {alpha: 0.3}, 0.5);	
			FlxTween.tween(graphBadDown, {alpha: 0.3}, 0.5);	
			FlxTween.tween(graphShitUp, {alpha: 0.3}, 0.5);
			FlxTween.tween(graphShitDown, {alpha: 0.3}, 0.5);	
			FlxTween.tween(graphMiss, {alpha: 0.3}, 0.5);	
				
		    FlxTween.tween(graphSizeUp, {alpha: 0.75}, 0.5);
		    FlxTween.tween(graphSizeDown, {alpha: 0.75}, 0.5);
		    FlxTween.tween(graphSizeLeft, {alpha: 0.75}, 0.5);
		    FlxTween.tween(graphSizeRight, {alpha: 0.75}, 0.5);	
		});
		
		new FlxTimer().start(2.5, function(tmr:FlxTimer){
			FlxTween.tween(backText, {alpha: 1}, 1);	
		});
		
		
		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];
		
		
		
	}
	
    
	override function update(elapsed:Float)
	{   
	    var botplay:String = 'Close';
		if (ClientPrefs.getGameplaySetting('botplay')) botplay = 'Open';
		var practice:String = 'Close';
		if (ClientPrefs.getGameplaySetting('practice')) practice = 'Open';

		setGameText.text = 'healthGain: X' + ClientPrefs.getGameplaySetting('healthgain')
		+ '  healthLoss: X' + ClientPrefs.getGameplaySetting('healthloss')
		+ '\n'
		+ 'SongSpeed: X' + ClientPrefs.getGameplaySetting('scrollspeed')
		+ '  PlaybackRate: X' + ClientPrefs.getGameplaySetting('songspeed')
		+ '\n'
		+ 'BotPlay: ' + botplay
		+ '  PracticeMode: ' + practice
		+ '\n'
		+ 'Finished time: ' + Date.now().toString()
		+ '\n';
		
	
		if(FlxG.keys.justPressed.ESCAPE #if android || FlxG.android.justReleased.BACK #end)
		{
		    MusicBeatState.switchState(new FreeplayState());
		}
		    PlayState.cancelMusicFadeTween();
	}

	override function destroy()
	{

		super.destroy();
	}

	
	
}
