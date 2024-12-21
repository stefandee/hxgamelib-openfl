// Example implementation of the abstract class StringManager 
// Uses two languages, EN and RO
// To add a new language:
// * add the language package(s) in the data.xml as binary
// * add the language package(s) in the Data.hx file as ByteData
// * add in the Language enum the language needed
// * init the new language package(s) in the SetLang method of GLStringManager class

// openfl
import openfl.Assets;

// app
import gamelib.stringmanager.StringManager;
import Data;

enum Language
{
  Language_EN;
  Language_RO;
}

class GLStringManager extends StringManager
{
  @:isVar public var Lang(get, set) : Language;

  public function new()
  {
    super();

    Lang = Language_EN;
  }

  private function get_Lang() : Language
  {
    return Lang;
  }

  private function set_Lang(v : Language) : Language
  {
    trace("setting lang " + v + "/" + Lang);

    if (v != Lang)
    {
      Lang = v;

      StringPackages = new Array();

      switch(Lang)
      {
        case Language_EN:
        {

          StringPackages.push(new StringPackage(Assets.getBytes("LangData_EN")));
        }

        case Language_RO:
        {
          StringPackages.push(new StringPackage(Assets.getBytes("LangData_RO")));
        }
      }
    }

    return Lang;
  }
}