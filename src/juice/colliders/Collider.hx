package juice.colliders;

import juice.core.Component;
import juice.geometry.Rectangle;
import juice.Juice;

class Collider extends Component
{

	private var internalHitbox:Rectangle;
	public var hitbox(get, set):Rectangle;

	public function new(hitbox:Rectangle){
		super();
		this.visible = true;

		this.hitbox = hitbox;
		this.position.x = hitbox.x;
		this.position.y = hitbox.y;
	}

	override public function update():Void {
		super.update();
	}

	override public function render():Void {
		super.render();

		// juice.graphics.Draw.drawFilledRect(hitbox, juice.utils.ColourTools.WHITE);
	}
	
	public function get_hitbox():Rectangle {
		return new Rectangle(	
			entity.position.x + this.position.x,
			entity.position.y + this.position.y,
			internalHitbox.width * Math.abs(entity.scale.x), 
			internalHitbox.height * Math.abs(entity.scale.y) 
		);
	}

	public function set_hitbox(box:Rectangle):Rectangle {
		return internalHitbox = box;
	}
}