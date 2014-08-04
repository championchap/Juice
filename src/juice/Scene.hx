package juice;

import juice.Entity;

class Scene
{

	private var entities:Array<Entity> = new Array<Entity>();

	public function new(){
	}

	public function add(ent:Entity):Void {
		ent.depth = entities.length;
		entities.push(ent);
		ent.scene = this;
		ent.start();
	}

	public function remove(ent:Entity):Void {
		entities.remove(ent);
		ent.end();
	}

	private function sortByDepth(ents:Array<Entity>):Void {
		// I think this probably isn't ideal 
		ents.sort(
			function (a:Entity, b:Entity) {
				if(a.depth > b.depth) {
					return 1;
				}

				if(a.depth < b.depth) {
					return -1;
				}

				return 0;
			}
		);
	}

	public function start():Void {
		
	}

	public function end():Void {

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