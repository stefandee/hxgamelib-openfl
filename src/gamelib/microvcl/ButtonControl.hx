package gamelib.microvcl;

class ButtonControl extends Control
{
  @:isVar public var checked (get, set) : Bool;
  @:isVar public var clicksDisabled (get, set) : Bool;

  public function new(parentControl : gamelib.microvcl.Control, name : String, displayTactics : DisplayTactics, autoAdd : Bool)
  {
    super(parentControl, name, displayTactics, autoAdd);

    checked = false;
    clicksDisabled = false;

    //mouseChildren = false;
  }

  private function get_checked() : Bool
  {
    return checked;
  }

  private function set_checked(v : Bool) : Bool
  {
    checked = v;

    return checked;
  }

  private function get_clicksDisabled() : Bool
  {
    return clicksDisabled;
  }

  private function set_clicksDisabled(v : Bool) : Bool
  {
    clicksDisabled = v;

    return clicksDisabled;
  }
}