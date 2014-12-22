package juice;

// JavaScript Stuff
import js.Browser;
import js.html.CanvasElement;
import js.html.Document;
import js.html.Event;
import js.html.ClientRect;
import js.html.CanvasRenderingContext2D;

// Haxe Stuff
import haxe.Timer;

// My Stuff
import juice.input.Input;
import juice.geometry.Rectangle;
import juice.core.Scene;

class Juice
{

	private static var doc:Document;

	private static var canvas:CanvasElement;
	private static var canvasScaled:CanvasElement;

	private static var windowSize:Rectangle;

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

	private static var prevTime:Float = 0;
	public static var deltaTime:Float = 0;


	public function new(width:Int, height:Int, scene:Scene, fps:Int = 60){
		setup(width, height, scene, fps);
	}

	private function setup(w:Int, h:Int, s:Scene, fps:Int):Void {
		doc = Browser.window.document;
		canvas = doc.createCanvasElement();
		canvasScaled = doc.createCanvasElement();

		canvasScaled.id = "Juice";

		canvas.width = w;
		canvas.height = h;

		canvasScaled.width = w;
		canvasScaled.height = h;

		windowSize = new Rectangle(0, 0, doc.body.clientWidth, doc.body.clientHeight);
		viewPort = new Rectangle(0, 0, canvas.width, canvas.height);

		Browser.window.onresize = onResize;

		frameRate = fps;

		doc.body.onload = function (e:Event) {
			canvasCTX = canvas.getContext2d();
			canvasScaledCTX = canvasScaled.getContext2d();

			doc.body.appendChild(canvas);
			doc.body.appendChild(canvasScaled);

			canvasScaledCTX.imageSmoothingEnabled = smoothing;

			canvas.style.display = "none";

			clientRect = canvasScaled.getBoundingClientRect();

			input = new Input(canvasScaled);

			currentScene = s;
			currentScene.start();

			// start the main loop loop
			var timer:Timer = new Timer(Std.int((1 / fps)*1000));
			timer.run = loop;

			// TODO: This has caused some problems
			// Can't set the frame rate and spritesheet animations run at the wrong speed 
			// Browser.window.requestAnimationFrame(loop);
		}
	}

	private function onResize(e:Event):Void {
		resize();
	}

	private static function resize():Void {
		// we need to do this to be sure that the mouse position is recorded correctly
		clientRect = canvasScaled.getBoundingClientRect();

		windowSize = new Rectangle(0, 0, doc.body.clientWidth, doc.body.clientHeight);
	}

	// TODO: The full screen canvas would probably be faster if scaled with CSS
	// Should allow for some GPU accelerated scaling, which I think is missing right now 
	public static function toggleFullScreen():Void {
		if(fullScreen == false) {
			canvasScaled.width = Std.int(windowSize.width);
			canvasScaled.height = Std.int(windowSize.height);

			canvasScaled.style.position = "absolute";
			canvasScaled.style.left = "0px";
			canvasScaled.style.top = "0px";
			canvasScaled.style.marginTop = "0px";

			var viewWidth:Float = 0;
			var viewHeight:Float = 0;

			var offX:Float = 0;
			var offY:Float = 0;

			if((canvasScaled.width / canvasScaled.height) > (canvas.width / canvas.height)) {
				viewWidth = canvasScaled.height * (canvas.width / canvas.height);
				viewHeight = canvasScaled.height;

				offX = (canvasScaled.width - viewWidth) / 2;
				offY = 0;

				scale = canvas.height / canvasScaled.height;
			} else {
				viewWidth = canvasScaled.width;
				viewHeight = canvasScaled.width * (canvas.height / canvas.width);

				offX = 0;
				offY = (canvasScaled.height - viewHeight) / 2;

				scale = canvas.width / canvasScaled.width;
			}

			viewPort = new Rectangle(offX, offY, viewWidth, viewHeight);

			fullScreen = true;
		} else {
			canvasScaled.style.position = "static";

			canvasScaled.width = canvas.width;
			canvasScaled.height = canvas.height;

			viewPort = new Rectangle(0, 0, canvas.width, canvas.height);

			scale = 1;

			fullScreen = false;
		}

		resize();
	}

	private function loop():Void {

		// swap out the scenes if there is one waiting
		if(nextScene != null) {
			if(currentScene != null){
				currentScene.end();
			}

			currentScene = nextScene;
			nextScene = null;
			currentScene.start();
		}

		update();
		render();

		// reset the input 
		input.update();

		// trace(timestamp - prevTime);
		// deltaTime = timestamp - prevTime;
		// prevTime = timestamp;

		// Browser.window.requestAnimationFrame(loop);
	}

	private function update():Void {
		if(currentScene != null){
			currentScene.update();
		}
	}

	// TODO: Figure out how and where to do Batched Rendering
	// TODO: Group layers into their own Canvases
	// TODO: Keep track of the areas of the Canvas that are updated and only redraw those parts 
	private function render():Void {
		//canvasCTX.save();
		canvasCTX.clearRect(0, 0, canvas.width, canvas.height);

		// update the background 
		canvasCTX.fillStyle = backgroundColour;
		canvasCTX.fillRect(0,0,canvas.width,canvas.height);
		
		// draw the new one 
		if(currentScene != null){
			currentScene.render();
		}

		//canvasCTX.restore();

		if(fullScreen) {
			// fill the borders in black 
			canvasScaledCTX.fillStyle = "#000000";
			canvasScaledCTX.fillRect(0, 0, canvasScaled.width, canvasScaled.height);
		}

		// draw to the scaled canvas
		canvasScaledCTX.drawImage(
			canvas, 
			0, 
			0, 
			canvas.width, 
			canvas.height, 
			viewPort.x, 
			viewPort.y, 
			viewPort.width, 
			viewPort.height
		);

	}

}