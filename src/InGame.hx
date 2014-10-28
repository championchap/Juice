package ;

// my stuff 
import juice.core.Scene;
import juice.core.Entity;
import juice.input.keyboard.Keyboard;
import juice.data.Texture;
import juice.data.Assets;
import juice.graphics.Image;
import juice.graphics.Animator;
import juice.graphics.TileMap;
import juice.utils.ColourTools;
import juice.Juice;

class InGame extends Scene
{

	private var hero:Hero;

	public function new(){
		super();
	}

	override public function start():Void {
		super.start();

		Juice.backgroundColour = ColourTools.GREY;

		hero = new Hero();
		hero.acceleration.y = 1;

		this.add(hero);
	}

	override public function update():Void {

		if(Juice.input.justPressed(Keyboard.P)) {
			if(Juice.paused == false) {
				Juice.paused = true;
			} else {
				Juice.paused = false;
			}
		}

		if(Juice.paused == false){

			super.update();

			if(Juice.input.isDown(Keyboard.W)) {
				hero.velocity.y = -10;
			}

			if(Juice.input.isDown(Keyboard.A)) {
				hero.velocity.x = -10;
			}

			if(Juice.input.isDown(Keyboard.S)) {
				hero.velocity.y = 10;
			}

			if(Juice.input.isDown(Keyboard.D)) {
				hero.velocity.x = 10;
			}

			if(Juice.input.justPressed(Keyboard.F)) {
				Juice.toggleFullScreen();
			}

			//hero.position.x = Juice.input.mouse.x;
			//hero.position.y = Juice.input.mouse.y;

			if(Juice.input.isDown(Keyboard.SPACE)) {
				hero.play("back");
			} else {
				hero.play("idle");
			}

		}

	}

}