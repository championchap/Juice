package ;

import juice.core.Entity;
import juice.graphics.Animator;
import juice.data.Assets;
import juice.utils.geometry.Point;

class Hero extends Entity
{

	private var sprite:Animator;

	public var acceleration:Point = new Point();
	public var velocity:Point = new Point();

	public function new(){
		super();

		sprite = new Animator(Assets.textures.get("Hero"), 65, 105);
		sprite.add("idle", [0, 1, 2, 3, 4, 5, 6, 7], 12);
		sprite.add("back", [7, 4, 0], 12);

		sprite.play("idle");

		add(sprite);
	}

	public function play(name:String):Void {
		if(sprite.currentName != name) {
			sprite.play(name, true);
		}
	}

	override public function update():Void {
		super.update();

		velocity.x += acceleration.x;
		velocity.y += acceleration.y;

		position.x += velocity.x;
		position.y += velocity.y;
	}
}