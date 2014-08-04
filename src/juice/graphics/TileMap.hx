package juice.graphics;

import juice.components.Image;
import juice.graphics.Texture;
import juice.utils.Rectangle;

class TileMap extends Image
{

	public var tileWidth:Int;
	public var tileHeight:Int;
	public var tileData:Array<Int>;

	public function new(texture:Texture, data:Array<Int>, tileWidth:Int, tileHeight:Int){
		super(texture, new Rectangle(0, 0, tileWidth, tileHeight));

		this.tileWidth = tileWidth;
		this.tileHeight = tileHeight;

		tileData = data;
	}

	override public function render():Void {

	}
}