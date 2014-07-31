package juice;

import juice.Entity;

class Scene
{

	private var entities:Array<Entity>;

	public function new(){
		entities = new Array<Entity>();
	}

	public function add(ent:Entity):Void {
		entities.push(ent);
	}

	public function remove(ent:Entity):Void {
		entities.remove(ent);
	}

	public function update():Void {
		for(i in 0...entities.length) {
			entities[i].update();
		}
	}

	public function render():Void {
		for(i in 0...entities.length) {
			entities[i].render();
		}
	}
}