package gamelib.microvcl;

import gamelib.microvcl.Button;

class Form extends Control
{
  @:isVar public var modalResult (get, set) : ModalResult;

  public function new(parentControl : gamelib.microvcl.Control, name : String, displayTactics : DisplayTactics, autoAdd : Bool)
  {
    super(parentControl, name, displayTactics, autoAdd);

    modalResult = ModalResult_None;
  }

  //
  // Members
  //
  private function get_modalResult() : ModalResult
  {
    return modalResult;
  }

  private function set_modalResult(v : ModalResult) : ModalResult
  {
    modalResult = v;

    return modalResult;
  }

  //
  // Methods
  //
  public function showModal()
  {
  }

  // for convenience only :)
  public function show()
  {
    visible = true;
  }

  public function hide()
  {
    visible = false;
  }
}