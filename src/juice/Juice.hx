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

class Juice
{

	private var doc:Document;
	private var canvas:CanvasElement;
	public var clientRect:ClientRect;

	public var ctx:CanvasRenderingContext2D;

	public var input:Input;

	public var fullScreen:Bool = false;

	private var currentScene:Scene;
	private var nextScene:Scene;

	private var windowSize:Rectangle;

	public var backgroundColour:String = "#336699";

	public function new(width:Int, height:Int, scene:Scene, fps:Int = 60){
		JG.game = this;

		setup(width, height, scene, fps);
	}

	private function setup(w:Int, h:Int, s:Scene, fps:Int):Void {
		doc = Browser.window.document;
		canvas = doc.createCanvasElement();

		canvas.id = "Juice";

		canvas.width = w;
		canvas.height = h;

		windowSize = new Rectangle(0, 0, doc.body.clientWidth, doc.body.clientHeight);

		Browser.window.onresize = onResize;

		doc.body.onload = function (e:Event) {
			ctx = canvas.getContext2d();

			doc.body.appendChild(canvas);

			clientRect = canvas.getBoundingClientRect();

			input = new Input(canvas);

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
		clientRect = canvas.getBoundingClientRect();

		windowSize = new Rectangle(0, 0, doc.body.clientWidth, doc.body.clientHeight);
	}

	// set the scene to change to 
	public function changeScene(next:Scene):Void {
		nextScene = next;
	}

	public function toggleFullScreen():Void {
		if(fullScreen == false) {
			canvas.width = Std.int(windowSize.width);
			canvas.height = Std.int(windowSize.height);

			canvas.style.position = "absolute";
			canvas.style.left = "0px";
			canvas.style.top = "0px";
			canvas.style.marginTop = "0px";

			fullScreen = true;
		} else {
			canvas.style.position = "relative";

			canvas.width = 720;
			canvas.height = 405;

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
	}

	private function update():Void {
		if(this.currentScene != null){
			currentScene.update();
		}
	}

	private function render():Void {
		ctx.clearRect(0, 0, canvas.width, canvas.height);

		// update the background 
		ctx.fillStyle = backgroundColour;
		ctx.fillRect(0,0,canvas.width,canvas.height);
		
		// draw the new one 
		if(this.currentScene != null){
			currentScene.render();
		}

	}

}