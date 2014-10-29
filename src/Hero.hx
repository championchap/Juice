package ;

import juice.core.Entity;
import juice.graphics.Animator;
import juice.data.Assets;
import juice.geometry.Point;
import juice.colliders.Collider;
import juice.geometry.Rectangle;

class Hero extends Entity
{

	private var sprite:Animator;

	public var acceleration:Point = new Point();
	public var velocity:Point = new Point();

	public var inAir:Bool = true;

	public function new(){
		super();

		sprite = new Animator(Assets.textures.get("Hero"), 65, 105);
		sprite.add("idle", [0, 1, 2, 3, 4, 5, 6, 7], 12);
		sprite.add("back", [7, 4, 0], 12);

		sprite.play("idle");

		add(sprite);

		var coll:Collider = new Collider(new Rectangle(0, 0, 65, 105));
		add(coll);
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