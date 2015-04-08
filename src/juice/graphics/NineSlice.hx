package juice.graphics;

import juice.graphics.Image;
import juice.graphics.Texture;
import juice.geometry.Rectangle;
import juice.graphics.Draw;
import juice.geometry.Point;
import juice.core.Entity;
import juice.utils.ColourTools;
import juice.text.Fonts;

class NineSlice extends Entity
{

	public var width:Int;
	public var height:Int;

	// this way is probs pretty dumb 
	public var borderThickness:BorderThickness;

	// this way is probably better 
	public var sliceTopLeft:Point;
	public var sliceBottomRight:Point;

	public function new(texture:Texture, width:Int, height:Int){
		super();

		borderThickness = new BorderThickness();
		borderThickness.bottom = 2;
		borderThickness.left = 2;
		borderThickness.right = 2;
		borderThickness.top = 2;

		this.width = width;
		this.height = height;
	}

	override public function render():Void {
		super.render();

		// figure out the sizes
		var middle = new Rectangle(
			position.x + borderThickness.left, 
			position.y + borderThickness.top,
			width - (borderThickness.left + borderThickness.right),
			height - (borderThickness.top + borderThickness.bottom)
		);

		var corner_tl = new Rectangle(
			position.x, 
			position.y,
			borderThickness.left,
			borderThickness.top
		);

		var corner_tr = new Rectangle(
			position.x + (width - borderThickness.right), 
			position.y,
			borderThickness.right,
			borderThickness.top
		);

		var corner_bl = new Rectangle(
			position.x, 
			position.y + (height - borderThickness.bottom),
			borderThickness.left,
			borderThickness.bottom
		);

		var corner_br = new Rectangle(
			position.x + (width - borderThickness.right), 
			position.y + (height - borderThickness.bottom),
			borderThickness.right,
			borderThickness.bottom
		);

		var top = new Rectangle(
			position.x + borderThickness.left, 
			position.y,
			width - (borderThickness.left + borderThickness.right),
			borderThickness.top
		);

		var right = new Rectangle(
			position.x + (width - borderThickness.right), 
			position.y + borderThickness.top,
			borderThickness.right,
			height - (borderThickness.bottom + borderThickness.top)
		);

		var bottom = new Rectangle(
			position.x + borderThickness.left, 
			position.y + (height - borderThickness.bottom),
			width - (borderThickness.left + borderThickness.right),
			borderThickness.bottom
		);

		var left = new Rectangle(
			position.x, 
			position.y + borderThickness.top,
			borderThickness.left,
			height - (borderThickness.bottom + borderThickness.top)
		);

		// draw the image
		Draw.patternRect(middle, juice.data.Assets.textures.get("Pattern").image);
		Draw.filledRect(corner_tl, ColourTools.WHITE);
		Draw.filledRect(corner_tr, ColourTools.WHITE);
		Draw.filledRect(corner_bl, ColourTools.WHITE);
		Draw.filledRect(corner_br, ColourTools.WHITE);
		Draw.filledRect(top, ColourTools.WHITE);
		Draw.filledRect(right, ColourTools.WHITE);
		Draw.filledRect(bottom, ColourTools.WHITE);
		Draw.filledRect(left, ColourTools.WHITE);
	}
}

class BorderThickness {
	public var top:Int = 2;
	public var right:Int = 2;
	public var bottom:Int = 2;
	public var left:Int = 2;

	public function new() {

	}
}