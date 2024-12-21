package gamelib;

import Math;
import flash.display.StageQuality;
import flash.external.ExternalInterface;
import flash.net.URLRequest;
import haxe.Int32;

class Utils
{
  public static function ArrayHas<T> (myElem : T, myArray : Array<T>) : Bool
  {
    for(elem in myArray)
    {
      if (elem == myElem)
      {
        return true;
      }
    }

    return false;
  }

  public static function IndexOf<T> (myElem : T, myArray : Array<T>) : Int
  {
    for(index in 0...myArray.length)
    {
      if (myArray[index] == myElem)
      {
        return index;
      }
    }

    return -1;    
  }

  public static function asBool(v : String) : Bool
  {
    if (v.toLowerCase() == "false")
    {
      return false;
    }

    return true;
  }

  public static function getQualityAsString(q : StageQuality) : String
  {
    return ("" + flash.Lib.current.stage.quality).toUpperCase();
  }

  public static function cycleQuality(q : StageQuality) : StageQuality
  {
    // TODO: should extract this code to a lib class
    var quality : StageQuality = StageQuality.LOW;

    switch(q)
    {
      case StageQuality.LOW:
        quality = StageQuality.MEDIUM;

      case StageQuality.MEDIUM:
        quality = StageQuality.HIGH;

      case StageQuality.HIGH:
        quality = StageQuality.BEST;

      case StageQuality.BEST:
        quality = StageQuality.LOW;
    }

    return quality;
  }

  //
  // method for opening a link
  //
  public static  function openLink (url : String) : Void
  {    
    // if browserAgent ends up null, we will use getURL
    var browserAgent : String = null;

    try 
    {
      if (ExternalInterface.available)
      {
        browserAgent = ExternalInterface.call("function getBrowser(){return navigator.userAgent;}");
      }
    } 
    catch (e : Dynamic) 
    {
      browserAgent = null;
    }

    //
    // have to do it this way, because of the way some popup-blockers work
    //
    if (browserAgent != null && 
        ExternalInterface.available && 
        ((browserAgent.indexOf("Firefox") >= 0) || (browserAgent.indexOf("MSIE") >= 0))) 
    {
      trace("window.open");
      ExternalInterface.call("window.open", url);
    } 
    else 
    {  
      trace("navigatetourl");

      flash.Lib.getURL(new URLRequest(url), "_blank");
    }
  }

  public static function parseUri(str : String, strictMode : Bool = false) : Map<String, String>
  {
    var r : EReg = strictMode ? 
      ~/^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/g :
      ~/^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/g;
    
    var result = r.match(str);

    var uri : Map<String, String> = new Map();
    
  	var key = ["source", "protocol", "authority", "userInfo", "user", "password", "host", "port", "relative", "path", "directory", "file", "query", "anchor"];

    if (result)
    {
      var i : Int = key.length;

      while (i >= 0)
      {
        try
        {
          var m = r.matched(i);
          
          uri.set(key[i], if (m != null) m else "");
        }
        catch(e : Dynamic)
        {
        }

        i--;
      }
    }

    return uri;
  }

  // in-place shuffle of an array with Fisher-Yates algorithm
  public static function shuffle<T> (myArray : Array<T>) : Void
  {
    var i : Int = myArray.length - 1;

    while(i > 1)
    {
      var randomIndex = Std.random(i + 1);

      if (i != randomIndex)
      {
        var tmp = myArray[i];
        myArray[i] = myArray[randomIndex];
        myArray[randomIndex] = tmp;
      }
      
      i--;
    }    
  }

  /**
   * Extended version of the StringTools.hex that ignores the sign and is able to
   * handle a bit more hexa values
   * 
   * TODO re-implement this if necessary
   * 
   * @param v
   * @return
   */
  /*
  public static function hex(v : Int) : String
  {
    var i32 = haxe.Int32.ofInt(v);

    // precompute some constants
    var i32_0 = haxe.Int32.ofInt(0);
    var i32_15 = haxe.Int32.ofInt(15);

    var s = "";
    var hexChars = "0123456789ABCDEF";    

    do {
      var r = haxe.Int32.and(i32, i32_15);
      s = hexChars.charAt(haxe.Int32.toInt(r)) + s;

      i32 = haxe.Int32.ushr(i32, 4);

    } while( haxe.Int32.compare(i32, i32_0) > 0);

    return s;
  }
  */

  public static function domainMatch(domain : String, host : String) : Bool
  {
    var r : EReg = new EReg(domain + "$", "gi");

    if (r.match(host))
    {
      var strLeft = r.matchedLeft();

      trace(strLeft);

      if (strLeft == "" || StringTools.endsWith(strLeft, "."))
      {
        return true;
      }
    }

    return false;    
  }

	/** Reverses <i>x</i>, e.g. Hello -> olleH */
	inline public static function reverse(x:String):String
	{
		var t = '';
		var i = x.length;
		while (i-- >= 0) t += x.charAt(i);
		return t;
	}
}