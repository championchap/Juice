package juice.graphics;

import juice.components.Image;
import juice.graphics.Texture;
import juice.utils.Rectangle;

class TileMap extends Image
{
	public function new(texture:Texture, tileWidth:Int, tileHeight:Int){
		super(texture, new Rectangle(0, 0, tileWidth, tileHeight));
	}
}