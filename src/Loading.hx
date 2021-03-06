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

		// Hero 
		//Assets.addTexture("Flap", "textures/flap.png");
		//Assets.addTexture("Run", "textures/run.png");
		//Assets.addTexture("Jump", "textures/jump.png");
		Assets.addTexture("Hero", "textures/hero.png");
		Assets.addTexture("Pattern", "textures/pattern.png");

		Assets.load();
	}

	override public function update():Void {
		super.update();

		if(Assets.percent < 100){
			// display % loaded
		} else {
			Juice.nextScene = new Testing();
		}
	}
}