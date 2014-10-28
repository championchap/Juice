package juice.core;

import juice.core.Entity;
import juice.geometry.Point;

class Component
{

	public var entity:Entity;

	public var position:Point = new Point();

	public var visible:Bool = true; // draws?
	public var active:Bool = true; // updates?

	public function new(){

	}

	public function start():Void {

	}

	public function end():Void {
		entity = null;
	}

	public function update():Void {

	}

	public function render():Void {
		
	}
}