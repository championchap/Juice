package juice.components;

// my stuff 
import juice.Component;
import juice.graphics.Texture;
import juice.graphics.Draw;
import juice.utils.Point;

class Image extends Component
{

	private var tex:Texture;

	public var position:Point;

	public function new(texture:Texture, xPos:Float = 0, yPos:Float = 0){
		super();

		tex = texture;

		position = new Point(xPos, yPos);
	}

	override public function render():Void {
		super.render();

		if(tex != null) {
			Draw.drawImage(
				tex.image, 
				tex.bounds.x,
				tex.bounds.y, 
				tex.width,
				tex.height,
				this.entity.position.x + position.x,
				this.entity.position.y + position.y,
				tex.width,
				tex.height
			);
		}
		
	}
}