package juice.utils;

// Javascript stuff 
import js.html.CanvasElement;
import js.html.Event;
import js.Browser;
import js.html.KeyboardEvent;

class Input
{

	private var keysDown:Array<Bool>;

	public function new(c:CanvasElement){
		keysDown = new Array<Bool>();

		// mouse stuff!
		c.onclick = onClick;
		c.oncontextmenu = onRightClick;

		// keyboard stuff!
		Browser.window.onkeydown = onKeyDown;
		Browser.window.onkeyup = onKeyUp;
	}

	public function isDown(key:Int):Bool {
		return keysDown[key];
	}

	public function isUp(key:Int):Bool {
		return keysDown[key];
	}

	private function onKeyDown(e:KeyboardEvent):Void {
		keysDown[e.keyCode] = true;
	}

	private function onKeyUp(e:KeyboardEvent):Void {
		keysDown[e.keyCode] = false;
	}

	private function onClick(e:Event):Void {
	}

	private function onRightClick(e:Event):Void {
		e.preventDefault();
	}
}