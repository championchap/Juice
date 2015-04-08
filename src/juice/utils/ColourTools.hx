package juice.utils;

class ColourTools
{
	// These colours are taken from 
	// http://www.keller.com/html-quickref/4a.html
	public static inline var BLACK:String 	= "#000000";
	public static inline var WHITE:String 	= "#FFFFFF";
	public static inline var GREY:String 	= "#808080";

	public static inline var RED:String 	= "#FF0000";
	public static inline var ORANGE:String 	= "#FFA500";
	public static inline var YELLOW:String 	= "#FFFF00";
	public static inline var GREEN:String 	= "#008000";
	public static inline var BLUE:String 	= "#0000FF";
	public static inline var INDIGO:String 	= "#4B0082";
	public static inline var VIOLET:String 	= "#EE82EE";


	public static function randomColour():String {
		var result:String = "#";

		return result += StringTools.hex(Std.int(0xffffff * Math.random()), 6);
	}

	// TODO, everything past this point! 
	public static function gradient() {

	}

	public static function interpolateBetween():Void {
		
	}

	public static function RGBToHex():Void {

	}

	public static function hexToRGB():Void {

	}

	public static function RGBToHSL():Void {

	}

	public static function HSLToRGB():Void {

	}

	public static function HexToHSL():Void {

	}

	public static function HSLToHex():Void {

	}
}