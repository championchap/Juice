package juice;

// js stuff 
import js.html.ClientRect;
import js.html.CanvasRenderingContext2D;

// my stuff 
import juice.Juice;
import juice.input.Input;
import juice.utils.geometry.Rectangle;
import juice.core.Scene;

class JG
{

	private static var game:Juice; // a reference to the Juice instance 

	public static var input:Input;

	public static var paused:Bool = false;

	public static var fullScreen:Bool = false;

	public static var clientRect:ClientRect;

	public static var viewPort:Rectangle;
	public static var scale:Float = 1;

	public static var smoothing:Bool = false;

	public static var backgroundColour:String = "#336699";

	public static var frameRate:Int;

	// Canvas Contexts
	public static var canvasCTX:CanvasRenderingContext2D;
	public static var canvasScaledCTX:CanvasRenderingContext2D;

	public static var currentScene:Scene;
	public static var nextScene:Scene;

	public static function setup(juice:Juice):Void {
		game = juice;
	}

	public static function toggleFullScreen():Void {
		game.toggleFullScreen();
	}

}