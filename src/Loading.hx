package ;

import juice.Scene;
import juice.Assets;

class Loading extends Scene
{
	public function new(){
		super();
	}

	override public function start():Void {
		super.start();

		Assets.addTexture("Pikachu", "sprite.png");
		Assets.load();
	}

	override public function update():Void {
		super.update();
	}
}