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

	public function new(width:Int, height:Int, fps:Int = 60){
		setup(width, height, fps);
	}

	private function setup(w:Int, h:Int, fps:Int):Void {
		doc = Browser.window.document;
		canvas = doc.createCanvasElement();

		canvas.width = w;
		canvas.height = h;

		ctx = canvas.getContext2d();

		doc.body.appendChild(canvas);

		input = new Input(canvas);

		// start the main loop loop
		var timer:Timer = new Timer(Std.int((1 / fps)*1000));
		timer.run = loop;
	}

	// swap the current scene out for a new one 
	public function changeScene(next:Scene):Void {
		nextScene = next;
	}

	private function loop():Void {
		update();
		render();
	}

	private function update():Void {
		// trace("poop");

		if(this.currentScene != null){
			currentScene.update();
		}
	}

	private function render():Void {
		// clear the previous frame 
		ctx.clearRect(0, 0, canvas.width, canvas.height);

		// draw the new one 
		if(this.currentScene != null){
			currentScene.render();
		}

	}

}