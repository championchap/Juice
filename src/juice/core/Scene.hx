package juice.core;

import juice.core.Entity;

class Scene
{

	private var entities:Array<Entity> = [];

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
		for(entity in entities) {
			if(entity.active) {
				entity.update();
			}
		}
	}

	public function render():Void {
		for(entity in entities) {
			if(entity.visible) {
				entity.render();
			}
		}
	}
}