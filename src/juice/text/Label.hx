package juice.text;

import juice.core.Entity;
import juice.graphics.Draw;
import juice.utils.ColourTools;

// A simple Label control to let you add text to things

class Label extends Entity {

	private var text:String = "";
	private var font:String = Fonts.Helvetica;
	private var fontSize:String = "10pt";
	private var colour:String = ColourTools.BLACK;

	public var width(get, null):Float;

	public function new(text:String) {
		super();

		this.text = text;
	}

	override public function update():Void {
		super.update();
	}

	override public function render():Void {
		super.render();

		Draw.fillText(
			text, 
			font, 
			fontSize,
			position, 
			colour
		);
	}

	public function get_width():Float {
		return Juice.canvasCTX.measureText(this.text).width;
	}
}