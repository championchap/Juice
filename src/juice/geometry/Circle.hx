package juice.geometry;

import juice.utils.NumberTools;

class Circle
{

	public var x:Float;
	public var y:Float;
	public var radius(default, set):Float;
	public var diameter(default, set):Float;
	public var circumference(get, set):Float;

	public function new(x:Float = 0, y:Float = 0, radius:Float = 0){
		this.x = x;
		this.y = y;
		set_radius(radius);
	}

	public function area():Float {
		return NumberTools.areaOfCircle(radius);
	}

	public function set_radius(r:Float):Float {
		radius = r;
		diameter = r * 2;
	}

	public function set_diameter(d:Float):Float {
		diameter = d;
		radius = d / 2;
	}

	public function get_circumference():Float {
		return NumberTools.circumferenceOfCircle(diameter);
	}

	public function set_circumference(c:Float):Float {
		circumference = c;
		set_diameter(c / Math.PI);
	}
}