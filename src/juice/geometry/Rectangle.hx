package juice.geometry;

import juice.utils.NumberTools;

class Rectangle
{

	public var x:Float;
	public var y:Float;

	public var width:Float;
	public var height:Float;

	public var area(get, null):Float;

	public function new(X:Float, Y:Float, Width:Float, Height:Float){
		x = X;
		y = Y;

		width = Width;
		height = Height;
	}

	private function get_area():Float {
		return NumberTools.areaOfRectangle(width, height);
	}
}