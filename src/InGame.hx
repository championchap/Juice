package ;

// my stuff 
import juice.core.Scene;
import juice.core.Entity;
import juice.input.keyboard.Keyboard;
import juice.graphics.Texture;
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

		trace(Assets.data.get("Fart"));
	}

	override public function update():Void {

		if(Juice.input.justPressed(Keyboard.P)) {
			if(Juice.paused == false) {
				Juice.paused = true;
			} else {
				Juice.paused = false;
			}
		}

		if(Juice.input.justPressed(Keyboard.F)) {
			Juice.toggleFullScreen();
		}

		if(Juice.paused == false){

			super.update();

			if(Juice.input.isDown(Keyboard.A)) {
				hero.velocity.x = -7;
			}

			if(Juice.input.isDown(Keyboard.D)) {
				hero.velocity.x = 7;
			}

			if(hero.inAir == false){
				if(Juice.input.justPressed(Keyboard.SPACE) || Juice.input.isMouseDown()) {
					hero.velocity.y = -20;
					hero.play("jump");
					hero.inAir = true;
<<<<<<< HEAD
					hero.rollingTimer = 60;
=======
					hero.rollTimer = 60;
>>>>>>> master
				}

				if(hero.rollTimer != 0){
					hero.rollTimer --;
				}

			} else {
				if(Juice.input.justPressed(Keyboard.SPACE) || Juice.input.isMouseDown()) {
					hero.velocity.y = -20;
					hero.play("flap", true);
<<<<<<< HEAD
					hero.rotation = -25;
=======
					hero.rotation = -20;
				}

				if(hero.velocity.y > 0){
					if(hero.rotation < 45){
						hero.rotation ++;
					}
>>>>>>> master
				}
			}

			if(!Juice.input.isDown(Keyboard.D) && !Juice.input.isDown(Keyboard.A)) {
				hero.velocity.x = 0;
				hero.acceleration.x = 0;
			}

			if(hero.position.y >= 355 && hero.velocity.y >= 0){
				if(hero.rollingTimer > 0){
					hero.rollingTimer --;
				}

				hero.position.y = 355;
				hero.inAir = false;
				hero.velocity.y = 0;
<<<<<<< HEAD

				if(hero.rollingTimer == 0) {
					hero.play("run");
				} else {
					hero.play("jump"); // not really jumping, just the same animation
				}
				

=======
				hero.rotation = 0;

				if(hero.rollTimer != 0){
					hero.play("jump"); // not really jump, but the animation is the same 
				} else {
					hero.play("run");
				}
				
>>>>>>> master
			} else {
				hero.inAir = true;
			}

		}

	}

}