package juice;

import js.Browser;
import js.html.CanvasElement;
import js.html.Document;

class Juice
{

	private var doc:Document;
	private var canvas:CanvasElement;

	public function new(){
		setup();
	}

	private function setup():Void {
		doc = Browser.window.document;
		canvas = doc.createCanvasElement();

		Browser.window.requestAnimationFrame( callback_ : js.html.RequestAnimationFrameCallback );
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