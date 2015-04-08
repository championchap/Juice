package juice.geometry;

import juice.utils.NumberTools;

class Polygon
{

	public var x:Float;
	public var y:Float;

	public var sides:Int;
	public var radius:Float;

	public function new(x:Float, y:Float, sides:Int, radius:Float){
		this.x = x;
		this.y = y;

		this.sides = sides;
		this.radius = radius;
	}

}