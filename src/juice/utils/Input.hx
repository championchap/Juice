package juice.utils;

// Javascript stuff 
import js.html.CanvasElement;
import js.html.EventListener;
import js.Browser;

class Input
{
	public function new(c:CanvasElement){
		// mouse stuff!
		c.onclick = onClick;

		// keyboard stuff!
		Browser.window.onkeydown = onKeyDown;
		Browser.window.onkeyup = onKeyUp;
		Browser.window.onkeypress = onKeyPress;
	}

	private function onKeyPress(e:EventListener):Void {
		trace("KEY PRESS!!!!");
	}

	private function onKeyDown(e:EventListener):Void {
		trace("Key Down!");
	}

	private function onKeyUp(e:EventListener):Void {
		trace("Key Up!");
	}

	private function onClick(e:EventListener):Void {
		trace("Clicked!");
	}
}