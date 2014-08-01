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

	private function sortByDepth(ents:Array<Entity>):Void {

	}

	public function update():Void {
		// sort all the entities by order of their depth 
		sortByDepth(entities);

		// update all of the entities 
		for(i in 0...entities.length) {
			if(entities[i].active) {
				entities[i].update();
			}
		}
	}

	public function render():Void {
		for(i in 0...entities.length) {
			if(entities[i].visible) {
				entities[i].render();
			}
		}
	}
}