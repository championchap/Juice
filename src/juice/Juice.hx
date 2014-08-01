package juice;

// JavaScript Stuff
import js.Browser;
import js.html.CanvasElement;
import js.html.Document;
import js.html.CanvasRenderingContext2D;

// Haxe Stuff
import haxe.Timer;

// My Stuff
import juice.utils.NumberTools;
import juice.utils.Input;
import juice.utils.keyboard.Keyboard;
import juice.Scene;

class Juice
{

	private var doc:Document;
	private var canvas:CanvasElement;

	private var ctx:CanvasRenderingContext2D;

	private var input:Input;

	private var currentScene:Scene;
	private var nextScene:Scene;

	public var backgroundColour:String = "#336699";

	public function new(width:Int, height:Int, scene:Scene, fps:Int = 60){
		setup(width, height, scene, fps);
	}

	private function setup(w:Int, h:Int, s:Scene, fps:Int):Void {
		doc = Browser.window.document;
		canvas = doc.createCanvasElement();

		canvas.width = w;
		canvas.height = h;

		ctx = canvas.getContext2d();

		doc.body.appendChild(canvas);

		input = new Input(canvas);

		currentScene = s;

		// start the main loop loop
		var timer:Timer = new Timer(Std.int((1 / fps)*1000));
		timer.run = loop;
	}

	// set the scene to change to 
	public function changeScene(next:Scene):Void {
		nextScene = next;
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

		// update the background 
		ctx.fillStyle = backgroundColour;
		ctx.fillRect(0,0,canvas.width,canvas.height);

		update();
		render();
	}

	private function update():Void {
		if(this.currentScene != null){
			currentScene.update();
		}
	}

	private function render():Void {
		// draw the new one 
		if(this.currentScene != null){
			currentScene.render();
		}

	}

}