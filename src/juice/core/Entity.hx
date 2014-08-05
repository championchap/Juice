package juice.core;

import juice.utils.geometry.Point;
import juice.core.Component;
import juice.core.Scene;

class Entity
{

	public var scene:Scene;
	public var name:String;
	public var position:Point = new Point(0, 0);
	public var visible:Bool = true; // should this be drawn or not?
	public var active:Bool = true; // shoud this be updated or not?
	public var depth:Int;

	// entities have their functionality extended through a list of components
	private var components:Array<Component> = new Array<Component>();

	public function new(){
	}

	public function start():Void {

	}

	public function end():Void {
		scene = null;
	}

	public function add(component:Component):Void {
		components.push(component);
		component.entity = this;
		component.start();
	}

	public function remove(component:Component):Void {
		components.remove(component);
		component.end();
	}

	public function update():Void {
		for(i in 0...components.length) {
			if(components[i].active) {
				components[i].update();
			}
		}
	}

	public function render():Void {
		for(i in 0...components.length) {
			if(components[i].visible) {
				components[i].render();
			}
		}
	}
}