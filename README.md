# Piron Games Haxe/OpenFL GameLib
It's a game library/framework for Haxe 3 and 4 and OpenFL, mainly targeting HTML5. It's superseded by [hxgamelib2-openfl](https://github.com/stefandee/hxgamelib2-openfl), a much more complex game dev library.

Main features:
* UI support via microvcl;
* [Sentry](https://github.com/stefandee/gametoolkit) sprites loading and rendering;
* localization (requires [StringTool](https://github.com/stefandee/gametoolkit) with [StringScript_HxGameLib_ByteArray.csl](tools/StringTool/StringScript_HxGameLib_ByteArray.csl) export script to convert data from a master sheet to a format usable by the library).

The library was ported from [haxgamelib](https://github.com/stefandee/hxgamelib) in 2018 to Haxe 3, and currently powers the HTML5 versions of [Born Of Fire TD](https://www.pirongames.com/born-of-fire-td/), [That Word Game](https://www.pirongames.com/that-word-game/) and [Invisible Ink](https://www.pirongames.com/invisible-ink/)

## Setup

To use the library in your project, install it using [haxelib git](https://lib.haxe.org/documentation/using-haxelib/#git):

```console
haxelib git hxgamelib-openfl https://github.com/stefandee/hxgamelib-openfl.git
```

## Usage

See [examples/gamelib](examples/gamelib), a very basic example covering the app/UI setup, l10n and sprite system.

To build the example data, download a [Piron Games Gametoolkit](https://github.com/stefandee/gametoolkit/releases) release and unpack it, then adjust the paths in [makedata.bat](examples/gamelib/assets/makedata.bat).

To build&run the example, use either [build.bat](examples/gamelib/build.bat) or

```console
openfl test html5
```

## License

Code license:
https://opensource.org/licenses/MIT

[Sprintf.hx](src/gamelib/Sprintf.hx) was ported to Haxe from an ActionScript 3 project and was licensed under GPL. The project it was part of no longer exists in public as far as I can see. It's not an essential part of the game library and there are alternatives licensed under licenses compatible with MIT.