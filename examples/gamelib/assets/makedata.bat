set GameToolkitPath=..\..\..\..\PironGames-GameToolkit-Win32-1.0.0

@rem English localization
IF NOT EXIST ".\strings\EN" mkdir ".\strings\EN"
"%GameToolkitPath%\StringTool.exe" -input ".\strings\Strings_EN.xml" -script "..\..\..\tools\StringTool\StringScript_HxGameLib_ByteArray.csl" -output ".\strings\EN"

@rem Romanian localization
IF NOT EXIST ".\strings\RO" mkdir ".\strings\RO"
"%GameToolkitPath%\StringTool.exe" -input ".\strings\Strings_RO.xml" -script "..\..\..\tools\StringTool\StringScript_HxGameLib_ByteArray.csl" -output ".\strings\RO"

cp -f ".\strings\EN\AllStrings.hx" "..\src\data"
cp -f ".\strings\EN\StringPackages.hx" "..\src\data"
