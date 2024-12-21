package gamelib.microvcl;

enum ModalResult
{
  ModalResult_None;
  ModalResult_Ok;
  ModalResult_Cancel;
  ModalResult_Abort;
  ModalResult_Retry;
  ModalResult_Ignore;
  ModalResult_Yes;
  ModalResult_No;
  ModalResult_All;
  ModalResult_YesToAll;
  ModalResult_NoToAll;
}

class Button extends ButtonControl
{
  @:isVar public var modalResult (get, set) : ModalResult;

  public function new(parentControl : gamelib.microvcl.Control, name : String, displayTactics : DisplayTactics, autoAdd : Bool)
  {
    super(parentControl, name, displayTactics, autoAdd);

    modalResult = ModalResult_None;
  }

  private function get_modalResult() : ModalResult
  {
    return modalResult;
  }

  private function set_modalResult(v : ModalResult) : ModalResult
  {
    modalResult = v;

    return modalResult;
  }

  private override function set_caption(v : String) : String
  {
    caption = v;

    if (displayTactics != null)
    {
      displayTactics.update();
    }

    return caption;
  }
}