package juice;

import juice.utils.Point;
import juice.Component;

class Entity
{

	public var name:String;
	public var position:Point;
	public var visible:Bool; // should this be drawn or not?
	public var active:Bool; // shoud this be updated or not?
	public var depth:Int;

	// entities have their functionality extended through a list of components
	private var components:Array<Component>;

	public function new(){
		components = new Array<Component>();
	}

	public function add(component:Component):Void {
		components.push(components);
	}

	public function remove(component:Component):Void {
		components.remove(Component);
	}

	public function update():Void {

	}

	public function render():Void {

	}
}