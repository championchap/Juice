package juice;

// js stuff 
import js.html.ClientRect;
import js.html.CanvasRenderingContext2D;

// my stuff 
import juice.Juice;
import juice.utils.Input;
import juice.utils.Rectangle;
import juice.Scene;

class JG
{

	public static var game:Juice; // I need it to get to toggleFullScreen at the moment 
	public static var input:Input;

	public static var fullScreen:Bool = false;

	public static var clientRect:ClientRect;

	public static var viewPort:Rectangle;
	public static var scale:Float = 1;

	public static var smoothing:Bool = false;

	public static var backgroundColour:String = "#336699";

	// Canvas Contexts
	public static var canvasCTX:CanvasRenderingContext2D;
	public static var canvasScaledCTX:CanvasRenderingContext2D;

	public static var currentScene:Scene;
	public static var nextScene:Scene;

	public function new(){
		
	}
}