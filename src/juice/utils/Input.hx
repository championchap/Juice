package juice.utils;

// Javascript stuff 
import js.html.CanvasElement;
import js.html.Event;
import js.Browser;
import js.html.KeyboardEvent;
import js.html.MouseEvent;

// my stuff
import juice.utils.Point;
import juice.JG;

class Input
{

	private var canvasRef:CanvasElement;

	private var keysDown:Array<Bool> = new Array<Bool>();
	private var mousePos:Point = new Point();

	public var mouse(get, null):Point;

	public function new(c:CanvasElement){
		canvasRef = c;

		// mouse stuff!
		c.onclick = onClick;
		c.oncontextmenu = onRightClick;

		c.onmousemove = onMouseMove;

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

	private function get_mouse():Point {
		return mousePos;
	}

	private function onClick(e:Event):Void {
	}

	private function onRightClick(e:Event):Void {
		e.preventDefault();
	}

	private function onMouseMove(e:MouseEvent):Void {
		// get the mouse position relative to the canvas 

		if(e.offsetX != null){
			mousePos.x = e.offsetX - JG.game.clientRect.left;
			mousePos.y = e.offsetY - JG.game.clientRect.top;
		}

		if(e.layerX != null){
			mousePos.x = e.layerX - JG.game.clientRect.left;
			mousePos.y = e.layerY - JG.game.clientRect.top;
		}

	}

}