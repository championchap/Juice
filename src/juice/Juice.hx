package juice;

import js.Browser;
import js.html.CanvasElement;
import js.html.Document;
import js.html.CanvasRenderingContext2D;

import haxe.Timer;

class Juice
{

	private var doc:Document;
	private var canvas:CanvasElement;

	private var ctx:CanvasRenderingContext2D;

	public function new(width:Int, height:Int, fps:Int = 60){
		setup(width, height, fps);
	}

	private function setup(w:Int, h:Int, fps:Int):Void {
		doc = Browser.window.document;
		canvas = doc.createCanvasElement();

		canvas.width = w;
		canvas.height = h;

		ctx = canvas.getContext2d();

		ctx.fillStyle = "#FF0000";
		ctx.fillRect(0, 0, canvas.width, canvas.height);

		doc.body.appendChild(canvas);

		var timer:Timer = new Timer(Std.int((1 / fps)*1000));
		timer.run = loop;
	}

	private function loop():Void {
		
	}

	private function start():Void {

	}

	private function update():Void {

	}

	private function render():Void {

	}

	private function end():Void {

	}


}