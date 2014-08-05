package juice.components;

// my stuff 
import juice.core.Component;
import juice.graphics.Texture;
import juice.graphics.Draw;
import juice.utils.Point;
import juice.utils.Rectangle;

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
			Draw.drawImage(
				texture.image, 
				bounds.x,
				bounds.y, 
				bounds.width,
				bounds.height,
				this.entity.position.x + position.x,
				this.entity.position.y + position.y,
				bounds.width * scale.x,
				bounds.height * scale.y
			);
		}
		
	}
}