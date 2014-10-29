package juice.colliders;

import juice.core.Component;
import juice.geometry.Rectangle;
import juice.Juice;

class Collider extends Component
{

	public var hitbox:Rectangle;

	public function new(hitbox:Rectangle){
		super();
		this.visible = false;

		this.hitbox = hitbox;
		this.position.x = hitbox.x;
		this.position.y = hitbox.y;
	}

	override public function update():Void {
		super.update();

		this.position = this.entity.position;

		if(this.position.x <= 0) {
			this.entity.position.x = 0;
		}

		if(this.position.x >= Juice.viewPort.width - hitbox.width) {
			this.entity.position.x = Juice.viewPort.width - hitbox.width;
		}
	}
	
}