import flash.events.Event;
import flash.events.ErrorEvent;
import flash.utils.ByteArray;
import flash.display.MovieClip;
import openfl.Assets;

// gamelib
import gamelib.sentry.SentrySprite;
import gamelib.sentry.SentrySpriteTemplate;
import gamelib.Lang;
import gamelib.Clock;

// app
import GLStringManager;
import data.StringPackages;
import data.AllStrings;

class FormMain extends gamelib.microvcl.Form
{ 
  private var StrMgr : GLStringManager;
  private var spr : SentrySprite;
  
  public function new(parentControl : gamelib.microvcl.Control, name : String, displayTactics : gamelib.microvcl.DisplayTactics, autoAdd : Bool)
  {
    super(parentControl, name, displayTactics, autoAdd);

    createUI();

    addEventListener(flash.events.Event.ADDED_TO_STAGE, onAddedToStage);
  }

  private function createUI()
  {
    //
    // String Manager test
    //
    StrMgr = new GLStringManager();
    trace(StrMgr.GetString(StringPackages.AllStrings, AllStrings.kStringID_AskDataOverwrite));

    StrMgr.Lang = Language_RO;
    trace(StrMgr.GetString(StringPackages.AllStrings, AllStrings.kStringID_AskDataOverwrite));

	//
	// Init the clock (sprite system makes use of it)
	//
    Clock.instance = new Clock();
    Clock.instance.reset();

	//
	// Sprite test
	//
    var sprTmpl : SentrySpriteTemplate = new SentrySpriteTemplate();	
    sprTmpl.Init(Assets.getBytes("SpriteData_Spee"));
	
    spr = new SentrySprite(sprTmpl);

	if (spr != null)
	{
		addChild(spr);
		
		spr.CurrentAnim = 0;
		spr.pause = false;
		spr.loop = true;

		spr.x = 240;
		spr.y = 240;  
	}	
  }
  
  private override function onEnterFrame(e : flash.events.Event)
  { 
    Clock.instance.update();
	
	spr.update();	
  }  
  
  public function onAddedToStage(e : flash.events.Event)
  {
  }  
}