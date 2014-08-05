package juice.input;

// Javascript stuff 
import js.html.CanvasElement;
import js.html.Event;
import js.Browser;
import js.html.KeyboardEvent;
import js.html.MouseEvent;

// my stuff
import juice.utils.geometry.Point;
import juice.JG;

class Input
{

	private var canvasRef:CanvasElement;

	private var keysDown:Array<Bool> = new Array<Bool>();
	private var keysPressed:Array<Bool> = new Array<Bool>();

	private var mousePos:Point = new Point();
	private var mouseDown:Bool = false;
	private var mouseJustDown:Bool = false;

	public var mouse(get, null):Point;

	public function new(c:CanvasElement){
		canvasRef = c;

		// populate the arrays with default values
		var i:Int = 0;

		while(i < 256) {
			keysDown[i] = false;
			keysPressed[i] = false;

			i++;
		}

		// mouse stuff!
		c.onmousedown = onMouseDown;
		c.onmouseup = onMouseUp;

		c.oncontextmenu = onContextMenu;

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

	public function justPressed(key:Int):Bool {
		return keysPressed[key];
	}

	public function clicked():Bool {
		return mouseJustDown;
	}

	public function isMouseDown():Bool {
		return mouseDown;
	}

	public function update():Void {
		// clear the keys
		for(i in 0...keysPressed.length) {
			keysPressed[i] = false;
		}

		// clear the mouse press
		mouseJustDown = false;
	}

	private function onKeyDown(e:KeyboardEvent):Void {
		if(keysDown[e.keyCode] == false) {
			keysPressed[e.keyCode] = true;
		}
		
		keysDown[e.keyCode] = true;
	}

	private function onKeyUp(e:KeyboardEvent):Void {
		keysDown[e.keyCode] = false;
	}

	private function get_mouse():Point {
		return mousePos;
	}

	private function onMouseDown(e:MouseEvent):Void {
		mouseDown = true;
		mouseJustDown = true;
	}

	private function onMouseUp(e:MouseEvent):Void {
		mouseDown = false;
	}

	private function onContextMenu(e:Event):Void {
		e.preventDefault();
	}

	private function onMouseMove(e:MouseEvent):Void {
		// get the mouse position relative to the canvas 

		var mx:Float = 0;
		var my:Float = 0;

		if(e.offsetX != null) {
			mx = e.offsetX;
			my = e.offsetY;
		}

		if(e.layerX != null) {
			mx = e.layerX;
			my = e.layerY;
		}

		// trace("scale: " + JG.game.scale);

		mousePos.x = (mx - (JG.clientRect.left + JG.viewPort.x)) * JG.scale;
		mousePos.y = (my - (JG.clientRect.top + JG.viewPort.y)) * JG.scale;

	}

}