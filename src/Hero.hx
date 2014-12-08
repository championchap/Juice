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

		sprite = new Animator(Assets.textures.get("Run"), 56, 48);

		sprite.add("run", [0, 1, 2, 3, 4, 5], 30);
		sprite.add("flap", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 30, false);
		sprite.add("jump", [0, 1, 2, 3], 12);

		sprite.play("run");

		add(sprite);

		var coll:Collider = new Collider(new Rectangle(0, 0, 56, 48));
		add(coll);
		
	}

	public function play(name:String, restart:Bool = false):Void {
		if(name == "flap") {
			sprite.texture = Assets.textures.get("Flap");
			sprite.frameHeight = 78;
			sprite.frameWidth = 55;
			sprite.position.y = -10;
		}

		if(name == "jump") {
			sprite.texture = Assets.textures.get("Jump");
			sprite.frameWidth = 41;
			sprite.frameHeight = 41;
			sprite.position.x = 0;
			sprite.position.y = 0;
		}

		if(name == "run") {
			sprite.texture = Assets.textures.get("Run");
			sprite.frameWidth = 56;
			sprite.frameHeight = 48;
			sprite.position.y = 0;
		}

		sprite.play(name, restart);
	}

	override public function update():Void {
		super.update();

		velocity.x += acceleration.x;
		velocity.y += acceleration.y;

		position.x += velocity.x;
		position.y += velocity.y;

		rotation ++;
	}
}