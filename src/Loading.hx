package ;

import juice.Scene;
import juice.Assets;
import juice.JG;

class Loading extends Scene
{
	public function new(){
		super();
	}

	override public function start():Void {
		super.start();

		Assets.addTexture("Pikachu", "textures/pikachu.png");
		Assets.addTexture("one", "textures/sprite1.png");
		Assets.addTexture("two", "textures/sprite2.png");
		Assets.addTexture("three", "textures/sprite3.png");
		Assets.addTexture("four", "textures/sprite4.png");
		Assets.addTexture("five", "textures/sprite5.png");

		Assets.load();
	}

	override public function update():Void {
		super.update();

		if(Assets.percent < 100){
			// trace(Assets.percent + "%");
		} else {
			JG.game.changeScene(new InGame());
		}
	}
}