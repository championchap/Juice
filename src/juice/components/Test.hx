package juice.components;

import juice.Component;
import juice.JG;

class Test extends Component
{
	public function new(){
		super();
	}

	override public function render():Void {
		JG.game.ctx.fillStyle = "#ffffff";
		JG.game.ctx.fillRect(this.entity.position.x, this.entity.position.y, 32, 48);
	}
}