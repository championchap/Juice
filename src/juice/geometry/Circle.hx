package juice.geometry;

import juice.utils.NumberTools;

class Circle
{

	public var x:Float;
	public var y:Float;
	public var radius:Float;

	public function new(x:Float = 0, y:Float = 0, radius:Float = 0){
		this.x = xPos;
		this.y = yPos;
		this.radius = radius;
	}

	public function area():Float {
		return NumberTools.areaOfCircle(radius);
	}
}