package ;

// my stuff 
import juice.Scene;
import juice.Entity;
import juice.components.Test;
import juice.JG;
import juice.utils.keyboard.Keyboard;
import juice.graphics.Texture;
import juice.Assets;
import juice.components.Image;
import juice.components.Animator;

class InGame extends Scene
{

	private var hero:Entity;

	public function new(){
		super();
	}

	override public function start():Void {
		super.start();

		JG.backgroundColour = "#333333";

		hero = new Entity();

		var heroTex:Texture = Assets.textures.get("hero");
		var ani:Animator = new Animator(heroTex, Std.int(heroTex.width / 15), Std.int(heroTex.height / 4));
		ani.add("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
						16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 
						30,	31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 
						44, 45,	46, 47, 48, 49, 50, 51, 52, 53, 54, 56, 56, 57, 58], 1);

		hero.add(ani);

		ani.play("idle");

		this.add(hero);
	}

	override public function update():Void {
		super.update();

		if(JG.input.isDown(Keyboard.W)) {
			hero.position.y --;
		}

		if(JG.input.isDown(Keyboard.A)) {
			hero.position.x --;
		}

		if(JG.input.isDown(Keyboard.S)) {
			hero.position.y ++;
		}

		if(JG.input.isDown(Keyboard.D)) {
			hero.position.x ++;
		}

		if(JG.input.justPressed(Keyboard.F)) {
			JG.game.toggleFullScreen();
		}

		hero.position.x = JG.input.mouse.x;
		hero.position.y = JG.input.mouse.y;

	}

}