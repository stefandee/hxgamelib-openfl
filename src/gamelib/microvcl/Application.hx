package gamelib.microvcl;

class Application
{
  @:isVar public var title (get, set) : String;
	public static var instance : Application;

	public var root : gamelib.microvcl.RootControl;

  public function new(title : String)
  {
    this.title = title;

    try
    {
      root = new gamelib.microvcl.RootControl("ApplicatonRootControl");
    }
    catch(e : Dynamic)
    {
      trace(e);
    }
  }

  private function get_title() : String
  {
    return title;
  }

  private function set_title(v : String) : String
  {
    title = v;

    return title;
  }

  public function getRoot() : gamelib.microvcl.RootControl
  {
    return root;
  }

  public function run()
  {
  }
}