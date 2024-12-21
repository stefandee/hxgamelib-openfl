// openfl
import flash.display.Sprite;
import flash.events.Event;

class GameLibTest extends gamelib.microvcl.Application
{
  public static var instance : GameLibTest;  
  
  public function new(title : String)
  { 
    super(title);

    try
    {
      this.root.stage.scaleMode = flash.display.StageScaleMode.EXACT_FIT;
    }
    catch(e : Dynamic)
    {
      trace(e);
    }
  }

  private function preLoad()
  {
    this.root.opaqueBackground = 0x000000;
	
    var form: FormMain = new FormMain(root, "FormMain", new gamelib.microvcl.DisplayTactics(), false);
	
    form.parentControl.addChild(form);
    form.enabled = true;
    form.x = 0;
    form.y = 0;	
  }

  static function main() 
  {
    trace("main()");

    // temporary traces redir
#if FirebugTraces
    if(haxe.Firebug.detect())
    {       
      haxe.Firebug.redirectTraces();
    }		
#end // FirebugTraces
    
    instance = new GameLibTest("Application::GameLibTest");

    instance.preLoad();
    instance.run();
	}
}
