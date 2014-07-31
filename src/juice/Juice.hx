package juice;

import js.Browser;
import js.html.CanvasElement;
import js.html.Document;

class Juice
{

	private var doc:Document;
	private var canvas:CanvasElement;

	public function new(width:Int, height:Int, fps:Int = 60){
		setup(width, height);
	}

	private function setup(w:Int, h:Int):Void {
		doc = Browser.window.document;
		canvas = doc.createCanvasElement();

		canvas.width = w;
		canvas.height = h;

		var cnx = canvas.getContext2d();

		cnx.fillStyle = "#FF0000";
		cnx.fillRect(0, 0, canvas.width, canvas.height);

		doc.body.appendChild(canvas);
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