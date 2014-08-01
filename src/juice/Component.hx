package juice;

import juice.Entity;

class Component
{

	public var entity:Entity;

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