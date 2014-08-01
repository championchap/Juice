package juice;

import juice.Entity;

class Component
{

	public var entitiy:Entity;

	public var visible:Bool = true;
	public var active:Bool = true;

	public function new(){

	}

	public function start():Void {

	}

	public function end():Void {
		entitiy = null;
	}

	public function update():Void {

	}

	public function render():Void {
		
	}
}