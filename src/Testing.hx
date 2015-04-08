package ;

// my stuff 
import juice.core.Scene;
import juice.core.Entity;
import juice.input.keyboard.Keys;
import juice.graphics.Texture;
import juice.data.Assets;
import juice.graphics.Image;
import juice.graphics.Animator;
import juice.geometry.Rectangle;
import juice.graphics.TileMap;
import juice.utils.ColourTools;
import juice.utils.Pool;
import juice.geometry.Point;
import juice.Juice;
import juice.graphics.NineSlice;
import juice.text.Label;

class Testing extends Scene
{

	private var slice:NineSlice;
	private var label:Label;

	public function new(){
		super();

		slice = new NineSlice(Assets.textures.get("Hero"), 64, 64);
		add(slice);

		slice.position.x = slice.position.y = 100;
		slice.borderThickness.left = 6;
		slice.borderThickness.top = 24;
		slice.borderThickness.right = 6;
		slice.borderThickness.bottom = 6;

		slice.width = 320;
		slice.height = 160;

		label = new juice.text.Label("Hello World");
		add(label);

		label.position.x = 100;
		label.position.y = 100;
	}

	override public function start():Void {
		super.start();
	}

	override public function update():Void {
		super.update();

		if(Juice.input.isMouseDown()) {
			slice.position.x = Juice.input.mouse.x - (slice.width / 2);
			slice.position.y = Juice.input.mouse.y - (slice.borderThickness.top / 2);
		}

		label.position.x = slice.position.x + 6;
		label.position.y = slice.position.y + 16;

		if(Juice.input.justPressed(Keys.F)) {
			Juice.toggleFullScreen();
		}
	}

	override public function render():Void {
		super.render();
	}

}