package juice;

// JavaScript Stuff
import js.Browser;
import js.html.CanvasElement;
import js.html.Document;
import js.html.CanvasRenderingContext2D;
import js.html.Event;
import js.html.ClientRect;

// Haxe Stuff
import haxe.Timer;

// My Stuff
import juice.utils.NumberTools;
import juice.utils.Input;
import juice.utils.keyboard.Keyboard;
import juice.Scene;
import juice.JG;
import juice.Assets;
import juice.utils.Rectangle;
import juice.graphics.Draw;

class Juice
{

	private var doc:Document;
	private var canvas:CanvasElement;

	private var canvasScaled:CanvasElement;

	private var currentScene:Scene;
	private var nextScene:Scene;

	private var windowSize:Rectangle;

	public function new(width:Int, height:Int, scene:Scene, fps:Int = 60){
		JG.game = this;

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
		JG.viewPort = new Rectangle(0, 0, canvas.width, canvas.height);

		Browser.window.onresize = onResize;

		doc.body.onload = function (e:Event) {
			JG.canvasCTX = canvas.getContext2d();
			JG.canvasScaledCTX = canvasScaled.getContext2d();

			doc.body.appendChild(canvas);
			doc.body.appendChild(canvasScaled);

			JG.canvasScaledCTX.imageSmoothingEnabled = false;

			canvas.style.display = "none";

			JG.clientRect = canvasScaled.getBoundingClientRect();

			JG.input = new Input(canvasScaled);

			currentScene = s;
			currentScene.start();

			// start the main loop loop
			var timer:Timer = new Timer(Std.int((1 / fps)*1000));
			timer.run = loop;
		}
	}

	private function onResize(e:Event):Void {
		resize();
	}

	private function resize():Void {
		// we need to do this to be sure that the mouse position is recorded correctly
		JG.clientRect = canvasScaled.getBoundingClientRect();

		windowSize = new Rectangle(0, 0, doc.body.clientWidth, doc.body.clientHeight);
	}

	// set the scene to change to 
	public function changeScene(next:Scene):Void {
		nextScene = next;
	}

	public function toggleFullScreen():Void {
		if(JG.fullScreen == false) {
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

				JG.scale = canvas.height / canvasScaled.height;
			} else {
				viewWidth = canvasScaled.width;
				viewHeight = canvasScaled.width * (canvas.height / canvas.width);

				offX = 0;
				offY = (canvasScaled.height - viewHeight) / 2;

				JG.scale = canvas.width / canvasScaled.width;
			}

			JG.viewPort = new Rectangle(offX, offY, viewWidth, viewHeight);

			JG.fullScreen = true;
		} else {
			canvasScaled.style.position = "relative";

			canvasScaled.width = canvas.width;
			canvasScaled.height = canvas.height;

			JG.viewPort = new Rectangle(0, 0, canvas.width, canvas.height);

			JG.scale = 1;

			JG.fullScreen = false;
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
		JG.input.clearPressed();
	}

	private function update():Void {
		if(this.currentScene != null){
			currentScene.update();
		}
	}

	private function render():Void {
		JG.canvasCTX.clearRect(0, 0, canvas.width, canvas.height);

		// update the background 
		JG.canvasCTX.fillStyle = JG.backgroundColour;
		JG.canvasCTX.fillRect(0,0,canvas.width,canvas.height);
		
		// draw the new one 
		if(this.currentScene != null){
			currentScene.render();
		}

		if(JG.fullScreen) {
			// fill the borders in black 
			JG.canvasScaledCTX.fillStyle = "#000000";
			JG.canvasScaledCTX.fillRect(0, 0, canvasScaled.width, canvasScaled.height);
		}

		// draw to the scaled canvas
		JG.canvasScaledCTX.drawImage(
			canvas, 
			0, 
			0, 
			canvas.width, 
			canvas.height, 
			JG.viewPort.x, 
			JG.viewPort.y, 
			JG.viewPort.width, 
			JG.viewPort.height
		);

	}

}