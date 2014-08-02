package ;

// my stuff 
import juice.Scene;
import juice.Entity;
import juice.components.Test;
import juice.JG;
import juice.utils.keyboard.Keyboard;

class InGame extends Scene
{

	private var hero:Entity;

	public function new(){
		super();
	}

	override public function start():Void {
		super.start();

		hero = new Entity();

		hero.add(new juice.components.Image(juice.Assets.textures.get("Pikachu"), -50, -50));

		this.add(hero);
	}

	override public function update():Void {
		super.update();

		if(JG.game.input.isDown(Keyboard.W)) {
			hero.position.y --;
		}

		if(JG.game.input.isDown(Keyboard.A)) {
			hero.position.x --;
		}

		if(JG.game.input.isDown(Keyboard.S)) {
			hero.position.y ++;
		}

		if(JG.game.input.isDown(Keyboard.D)) {
			hero.position.x ++;
		}

		hero.position.x = JG.game.input.mouse.x;
		hero.position.y = JG.game.input.mouse.y;

	}

}