package juice.graphics;

import juice.components.Image;
import juice.graphics.Texture;
import juice.utils.Rectangle;
import juice.graphics.Draw;

class TileMap extends Image
{

	public var tileWidth:Int;
	public var tileHeight:Int;
	public var width:Int;
	public var height:Int;
	public var tileData:Array<Int>;

	public function new(texture:Texture, data:Array<Int>, tileWidth:Int, tileHeight:Int, width:Int, height:Int){
		super(texture, new Rectangle(0, 0, tileWidth, tileHeight));

		this.tileWidth = tileWidth;
		this.tileHeight = tileHeight;

		this.width = width;
		this.height = height;

		if(data.length / width == height) {
			tileData = data;
		} else {
			throw "Error: data and dimensions don't match!";
		}
	}

	override public function render():Void {
		var tx:Int;
		var ty:Int;

		var px:Int;
		var py:Int;

		for(i in 0...tileData.length) {
			if(tileData[i] != -1) {

				if(i < width) {
					tx = i * tileWidth;
					ty = Math.floor(i / tileHeight);
				} else {
					tx = (i % width) * tileWidth;
					ty = Math.floor(i / width) * tileHeight;
				}

				if(tileData[i] < width) {
					px = tileData[i] * tileWidth;
					py = Math.floor(tileData[i] / tileHeight);
				} else {
					px = (tileData[i] % width) * tileWidth;
					py = Math.floor(tileData[i] / width) * tileHeight;
				}

				Draw.drawImage(
					this.texture.image, 
					px, 
					py, 
					tileWidth, 
					tileWidth, 
					tx, 
					ty, 
					tileWidth, 
					tileHeight 
				);
			}
		}
	}
}