package gamelib.microvcl;

class PageControl extends gamelib.microvcl.Control
{
  @:isVar public var activePage(default, set) : PageSheet;
  public var pages(default, null)               : Array<PageSheet>;
  public var pageCount(get, null)      : Int;

  public function new(parentControl : gamelib.microvcl.Control, controlName : String, displayTactics : PageControlTactics, autoAdd : Bool)
  {
    super(parentControl, name, displayTactics, autoAdd);

    pages      = new Array();
    activePage = null;
  }

  public function addPage(page : gamelib.microvcl.PageSheet)
  {
    page.index = pages.length;

    pages.push(page);

    if (!contains(page))
    {
      this.addChild(page);
    }

    if (displayTactics != null)
    {
      var temp : PageControlTactics = cast displayTactics;

      temp.notifyAddPage(page);
    }

    if (pages.length == 1)
    {
      activePage = page;

      page.visible = true;
      page.enabled = true;
    }
    else
    {
      page.visible = false;
      page.enabled = false;
    }
  }

  private function get_pageCount() : Int
  {
    if (pages != null)
    {
      return pages.length;
    }

    return 0;
  }

  public function getPageIndex(page : PageSheet) : Int
  {
    for(i in 0...pages.length)
    {
      if (page == pages[i])
      {
        return i;
      }
    }

    return -1;
  }

  private function set_activePage(page : PageSheet) : PageSheet
  {
    if (page == activePage)
    {
      return activePage;
    }

    for(temp in pages)
    {
      if (temp == page)
      {
        if (activePage != null)
        {
          activePage.visible = false;
          activePage.enabled = false;
        }
        
        activePage = page;

        activePage.visible = true;
        activePage.enabled = true;

        if (displayTactics != null)
        {
          var tempTactics : PageControlTactics = cast displayTactics;

          tempTactics.notifyActivePage(page);
          break;
        }
      }
    }

    return activePage;
  }
}