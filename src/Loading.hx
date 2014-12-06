package ;

import juice.core.Scene;
import juice.data.Assets;
import juice.Juice;

class Loading extends Scene
{
	public function new(){
		super();
	}

	override public function start():Void {
		super.start();

		Assets.addTexture("Flap", "textures/flap.png");
		Assets.addTexture("Run", "textures/run.png");
		Assets.addData("Fart", "data/fart.txt");

		Assets.load();
	}

	override public function update():Void {
		super.update();

		if(Assets.percent < 100){
			// display % loaded
		} else {
			Juice.nextScene = new InGame();
		}
	}
}