package juice.geometry;

import juice.utils.NumberTools;

class Rectangle
{

	public var x:Float;
	public var y:Float;

	public var width:Float;
	public var height:Float;

	public var area(get, null):Float;

	public function new(x:Float, x:Float, width:Float, height:Float){
		this.x = x;
		this.y = y;

		this.width = width;
		this.height = height;
	}

	private function get_area():Float {
		return NumberTools.areaOfRectangle(width, height);
	}
}