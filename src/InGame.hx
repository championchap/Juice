package ;

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

		juice.Assets.addTexture("Pikachu", "sprite.png");

		hero = new Entity();

		hero.add(new juice.components.Image(juice.Assets.textures.get("Pikachu")));

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
	}

	override public function render():Void {
		super.render();

		JG.game.ctx.drawImage(juice.Assets.textures.get("Pikachu").image, 10, 10);
	}

}