package juice.utils;

// Javascript stuff 
import js.html.CanvasElement;
import js.html.Event;
import js.Browser;

class Input
{

	private var up:Array<Bool>;
	private var down:Array<Bool>;
	private var pressed:Array<Bool>;

	public function new(c:CanvasElement){
		up = new Array<Bool>();
		down = new Array<Bool>();
		pressed = new Array<Bool>();

		// mouse stuff!
		c.onclick = onClick;
		c.oncontextmenu = onRightClick;

		// keyboard stuff!
		Browser.window.onkeydown = onKeyDown;
		Browser.window.onkeyup = onKeyUp;
		Browser.window.onkeypress = onKeyPress;
	}

	public function check():bool {

	}

	private function onKeyPress(e:Event):Void {
		e.preventDefault();
	}

	private function onKeyDown(e:Event):Void {
		e.preventDefault();
	}

	private function onKeyUp(e:Event):Void {
		e.preventDefault();
	}

	private function onClick(e:Event):Void {
		e.preventDefault();
	}

	private function onRightClick(e:Event):Void {
		e.preventDefault();
	}
}