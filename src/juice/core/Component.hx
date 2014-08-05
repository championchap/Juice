package juice.core;

import juice.core.Entity;
import juice.utils.Point;

class Component
{

	public var entity:Entity;

	public var position:Point = new Point();

	public var visible:Bool = true;
	public var active:Bool = true;

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