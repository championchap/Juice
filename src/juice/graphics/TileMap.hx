package juice.graphics;

import juice.components.Image;
import juice.graphics.Texture;
import juice.utils.Rectangle;

class TileMap extends Image
{

	public var tileWidth:Int;
	public var tileHeight:Int;
	public var columns:Int;
	public var rows:Int;

	public function new(texture:Texture, tileWidth:Int, tileHeight:Int, columns:Int, rows:Int){
		super(texture, new Rectangle(0, 0, tileWidth, tileHeight));

		this.tileWidth = tileWidth;
		this.tileHeight = tileHeight;
		this.columns = columns;
		this.rows = rows;
	}
}