package juice.components;

// my stuff 
import juice.Component;
import juice.graphics.Draw;
import juice.utils.Rectangle;

class Test extends Component
{
	public function new(){
		super();
	}

	override public function render():Void {
		super.render();

		Draw.drawFilledRect(new Rectangle(this.entity.position.x, this.entity.position.y, 32, 64), "#333333");
	}
}