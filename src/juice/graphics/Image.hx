package juice.graphics;

// my stuff 
import juice.core.Component;
import juice.graphics.Texture;
import juice.graphics.Draw;
import juice.geometry.Point;
import juice.geometry.Rectangle;

class Image extends Component
{

	public var texture:Texture;
	public var bounds:Rectangle;
	public var scale:Point = new Point(1, 1);

	public function new(texture:Texture, bounds:Rectangle){
		super();

		this.texture = texture;

		if(bounds == null){
			bounds = new Rectangle(0, 0, texture.width, texture.height);
		} else {
			this.bounds = bounds;
		}
	}

	override public function render():Void {
		super.render();

		if(texture != null) {
			Draw.image(
				texture.image, 
				bounds.x,
				bounds.y, 
				bounds.width,
				bounds.height,
				this.entity.position.x + this.position.x,
				this.entity.position.y + this.position.y,
				bounds.width * scale.x,
				bounds.height * scale.y,
				this.entity.rotation, 
				this.entity.scale
			);
		}
		
	}
}