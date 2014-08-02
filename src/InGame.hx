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

class InGame extends Scene
{

	private var hero:Entity;

	public function new(){
		super();
	}

	override public function start():Void {
		super.start();

		hero = new Entity();

		var heroTex:Texture = Assets.textures.get("Pikachu");
		hero.add(new Image(heroTex, -heroTex.width / 2, -heroTex.height / 2));

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

		if(JG.game.input.isDown(Keyboard.F)) {
			JG.game.toggleFullScreen();
		}

		hero.position.x = JG.game.input.mouse.x;
		hero.position.y = JG.game.input.mouse.y;

	}

}