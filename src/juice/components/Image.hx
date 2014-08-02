package juice.components;

// my stuff 
import juice.Component;
import juice.graphics.Texture;
import juice.graphics.Draw;

class Image extends Component
{

	private var tex:Texture;

	public function new(texture:Texture){
		super();

		tex = texture;
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
				this.entity.position.x,
				this.entity.position.y,
				tex.width,
				tex.height
			);
		}
		
	}
}