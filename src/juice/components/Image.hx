package juice.components;

import juice.Component;
import juice.graphics.Texture;

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
			juice.JG.game.ctx.drawImage(
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