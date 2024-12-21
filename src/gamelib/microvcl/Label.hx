package gamelib.microvcl;

// this class is for convenience only
class Label extends Control
{
  public function new(parentControl : gamelib.microvcl.Control, name : String, displayTactics : DisplayTactics, autoAdd : Bool)
  {
    super(parentControl, name, displayTactics, autoAdd);
  }

  private override function set_caption(v : String) : String
  {
    super.caption = v;

    if (displayTactics != null)
    {
      displayTactics.update();
    }

    //trace(caption);

    return caption;
  }
}