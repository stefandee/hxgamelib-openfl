package gamelib.microvcl;

enum HelpType
{
  HelpType_Context;
  HelpType_Keyword;
}

enum BiDiMode
{
  BiDiMode_LeftToRight;
  BiDiMode_RightToLeft;
  BiDiMode_RightToLeftNoAlign;
  BiDiMode_RightToLeftReadingOnly;
}

class Control extends flash.display.Sprite
{
  //
  // Properties
  //
  @:isVar public var enabled (get, set)    : Bool;
  @:isVar public var parentControl(get, set) : Control;

  @:isVar public var controlName (get, set) : String;
  @:isVar public var caption (get, set)    : String;
  @:isVar public var text (get, set)             : String;

  @:isVar public var hint (get, set)             : String;
  @:isVar public var showHint (get, set) : Bool;
  @:isVar public var parentShowHint (get, set) : Bool;

  @:isVar public var helpContext (get, set) : Int;
  @:isVar public var helpKeyword (get, set) : String;
  @:isVar public var helpType    (get, set)       : HelpType;

  @:isVar public var bidiMode (get, set) : BiDiMode;
  @:isVar public var parentBiDiMode (get, set) : Bool;

  public var displayTactics : DisplayTactics;

  public var autoAdd        : Bool;

  //
  // Events
  //
  @:isVar public var onClickEvent(get, set) : Dynamic -> Void;

  public function new(parentControl : gamelib.microvcl.Control, controlName : String, displayTactics : DisplayTactics, autoAdd : Bool)
  {
    super();

    this.parentControl = parentControl;

    this.autoAdd = autoAdd;
    
    if (autoAdd && parentControl != null)
    {
      parentControl.addChild(this);
    }

    enabled   = true;

    this.controlName = controlName;

    hint     = "";
    caption  = "";
    text     = "";
    showHint = false;
    parentShowHint = false;

    helpContext = -1;
    helpKeyword = "";
    helpType    = HelpType_Context;

    bidiMode = BiDiMode_LeftToRight;
    parentBiDiMode = false;    

    if (displayTactics != null)
    {
      //trace("control::ctor - dt start");
      this.displayTactics = displayTactics;
      displayTactics.target = this;
      displayTactics.init();
      displayTactics.update();
      //trace("control::ctor - dt end");
    }
  }

  private function get_enabled() : Bool
  {
    return enabled;
  }

  private function set_enabled(v : Bool) : Bool
  {
    enabled = v;

    // TODO: add more mouse events, depending on the application needs
    if (enabled)
    {
      // register the events
      removeEventListener(flash.events.Event.ENTER_FRAME, onEnterFrame);
      removeEventListener(flash.events.MouseEvent.CLICK, onClick);
      
      addEventListener(flash.events.Event.ENTER_FRAME, onEnterFrame);
      addEventListener(flash.events.MouseEvent.CLICK, onClick);

      // TODO: iterate over the Control children and enable them
    }
    else
    {
      // unregister the events
      removeEventListener(flash.events.Event.ENTER_FRAME, onEnterFrame);
      removeEventListener(flash.events.MouseEvent.CLICK, onClick);

      // TODO: iterate over the Control children and disable them
    }

    for(index in 0...numChildren)
    {
      try
      {
        var control : gamelib.microvcl.Control = cast getChildAt(index);

        control.enabled = enabled;
      }
      catch(e : Dynamic)
      {
      }
    }

    return enabled;
  }

  private function get_controlName() : String
  {
    return controlName;
  }

  private function set_controlName(v : String) : String
  {
    controlName = v;

    return controlName;
  }
  
  private function get_hint() : String
  {
    return hint;
  }

  private function set_hint(v : String) : String
  {
    hint = v;

    return hint;
  }

  private function get_caption() : String
  {
    return caption;
  }

  private function set_caption(v : String) : String
  {
    caption = v;

    return caption;
  }

  private function get_text() : String
  {
    return text;
  }

  private function set_text(v : String) : String
  {
    text = v;

    return text;
  }

  private function get_showHint() : Bool
  {
    return showHint;
  }

  private function set_showHint(v : Bool) : Bool
  {
    showHint = v;

    return showHint;
  }

  private function get_parentShowHint() : Bool
  {
    return parentShowHint;
  }

  private function set_parentShowHint(v : Bool) : Bool
  {
    parentShowHint = v;

    return parentShowHint;
  }

  private function get_helpContext() : Int
  {
    return helpContext;
  }

  private function set_helpContext(v : Int) : Int
  {
    helpContext = v;

    return helpContext;
  }

  private function get_helpKeyword() : String
  {
    return helpKeyword;
  }

  private function set_helpKeyword(v : String) : String
  {
    helpKeyword = v;

    return helpKeyword;
  }

  private function get_helpType() : HelpType
  {
    return helpType;
  }

  private function set_helpType(v : HelpType) : HelpType
  {
    helpType = v;

    return helpType;
  }

  private function get_bidiMode() : BiDiMode
  {
    return bidiMode;
  }

  private function set_bidiMode(v : BiDiMode) : BiDiMode
  {
    bidiMode = v;

    return bidiMode;
  }

  private function get_parentBiDiMode() : Bool
  {
    return parentBiDiMode;
  }

  private function set_parentBiDiMode(v : Bool) : Bool
  {
    parentBiDiMode = v;

    return parentBiDiMode;
  }

  private function get_parentControl() : Control
  {
    return parentControl;
  }

  private function set_parentControl(control : Control) : Control
  {
    if (parentControl != null)
    {
      if (parentControl.contains(this))
      {
        parentControl.removeChild(this);
      }
    }
    
    parentControl = control;

    if (parentControl != null)
    {
      if (!parentControl.contains(this) && this.autoAdd)
      {
        parentControl.addChild(this);
      }
    }

    return parentControl;
  }

  //
  // Events
  //
  private function get_onClickEvent() : Dynamic -> Void
  {
    return onClickEvent;
  }

  private function set_onClickEvent(v : Dynamic -> Void) : Dynamic -> Void
  {
    onClickEvent = v;

    return onClickEvent;
  }

  private function onEnterFrame(e : flash.events.Event)
  {
    //trace("onenterframe: " + controlName);
  }

  private function onClick(e : flash.events.Event)
  {
    //trace("onClick " + controlName);
    
    if (onClickEvent != null && enabled)
    {
      onClickEvent(e);
    }
  }

  // TODO: find a better way to implement this - maybe with an event listener
  // override this in child classes to update accordingly when the language changes
  public function onLanguageChange(?strMgr : gamelib.stringmanager.StringManager = null)
  {
    if (displayTactics != null)
    {
      displayTactics.onLanguageChange(strMgr);
    }
    
    // also notify the children that the language changed; it's not a fast operation
    for(index in 0...numChildren)
    {
      try
      {
        var control : gamelib.microvcl.Control = cast getChildAt(index);

        control.onLanguageChange(strMgr);
      }
      catch(e : Dynamic)
      {
      }
    }
  }
}