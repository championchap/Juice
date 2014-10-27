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
import juice.Juice;

class InGame extends Scene
{

	private var hero:Entity;
	private var terrain:Entity;

	public function new(){
		super();
	}

	override public function start():Void {
		super.start();

		Juice.backgroundColour = "#202020";

		hero = new Entity();

		var heroTex:Texture = Assets.textures.get("hero");
		var ani:Animator = new Animator(heroTex, Std.int(heroTex.width / 15), Std.int(heroTex.height / 4));
		ani.add("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
						16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 
						30,	31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 
						44, 45,	46, 47, 48, 49, 50, 51, 52, 53, 54, 56, 56, 57, 58], 30);

		hero.add(ani);

		ani.play("idle");

		terrain = new Entity();
		var level:Array<Int> = [];

		for(i in 0...84){
			if(juice.utils.NumberTools.randomBool()) {
				level.push(juice.utils.NumberTools.randomInt(90, 0));
			} else {
				level.push(-1);
			}
			
		}

		var tilemap:TileMap = new TileMap(Assets.textures.get("three"), level, 60, 60, 12, 7);

		terrain.add(tilemap);

		this.add(terrain);
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
				hero.position.y --;
			}

			if(Juice.input.isDown(Keyboard.A)) {
				hero.position.x --;
			}

			if(Juice.input.isDown(Keyboard.S)) {
				hero.position.y ++;
			}

			if(Juice.input.isDown(Keyboard.D)) {
				hero.position.x ++;
			}

			if(Juice.input.justPressed(Keyboard.F)) {
				Juice.toggleFullScreen();
			}

			//hero.position.x = JG.input.mouse.x;
			//hero.position.y = JG.input.mouse.y;

		}

	}

}