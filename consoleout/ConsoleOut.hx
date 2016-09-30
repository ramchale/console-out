package consoleout;

import neko.Lib;

enum Color
{
	Black;
	Red;
	Green;
	Yellow;
	Blue;
	Magenta;
	Cyan;
	White;
}

enum DisplayAttribute
{
	Reset;        // normal
	Bold;
	Faint;        // not widely supported
	Italic;       // not widely supported
	Underline;
	Blink;
	BlinkRapid;   // not widely supported
	Negative;
	Conceal;      // not widely supported
	CrossedOut;   // not widely supported
}

class ConsoleOut
{
	private static inline var CONSOLE_COMMAND_START:String = "\x1B[";

	private static inline var COMMAND_RESET = "0";
	private static inline var COMMAND_FOR
	private static inline var COMMAND_BACKGROUND_COLOR = "4";

	public static var outputCommands:Bool;

	public static function __init__()
	{
		// Neko Log.Out seems to have issues with utf8 on Windows
		if (Sys.systemName() == "Windows")
		{
			outputCommands = false;
		}
		else
		{
			outputCommands = true;
		}
	}

	public static function textFormatCodes(?foreground:Color, ?background:Color, ?attribute:DisplayAttribute):String
	{
		if (outputCommands)
		{
			var commands = new Array<String>();
			if (attribute == null && foreground == null && background == null)
			{
				commands.push(COMMAND_RESET); // reset
			}
			else
			{
				if (attribute != null) commands.push(Std.string(Type.enumIndex(attribute)));
				if (foreground != null) commands.push(COMMAND_FOREGROUND_COLOR + Type.enumIndex(foreground));
				if (background != null) commands.push(COMMAND_BACKGROUND_COLOR + Type.enumIndex(background));
			}
			return CONSOLE_COMMAND_START + commands.join(";") + "m";
		}
		else
		{
			return "";
		}
	}

  public static function print(message:String, ?foreground:Color, ?background:Color, ?attribute:DisplayAttribute)
  {
    Lib.println(textFormatCodes(foreground, background, attribute) + message + textFormatCodes());
  }

  public static function println(message:String, ?foreground:Color, ?background:Color, ?attribute:DisplayAttribute)
  {
    print(message + "\n", foreground, background, attribute);
  }
}
