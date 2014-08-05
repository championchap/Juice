package juice.utils;

#if flash
import flash.geom.Point;
import flash.system.Capabilities;
#end

#if js
import juice.utils.geometry.Point;
#end

/**
 *
 *	NumberTools
 *	A collection of functions for manipulating and generating numbers
 *
 */

class NumberTools
{

	// Used by fibonacci()
	// Stores the generated sequence so we don't need to work it all out every time
	private static var sequence:Array<Int> = [1, 1];

	// Generate a Random Float
	public static function randomFloat(max:Float, min:Float, excluding:Array<Float> = null):Float {
		var num:Float = Math.random()*(max - min) + min;
		if(excluding != null){
			while(floatInArray(num, excluding)){
				num = Math.random()*(max - min) + min;
			}
			return num;
		} else {
			return num;
		}
	}

	// Generate a Random Integer
	public static function randomInt(max:Int, min:Int, excluding:Array<Int> = null):Int {
		var num:Int = Math.round(Math.random()*(max - min) + min);
		if(excluding != null){
			while(intInArray(num, excluding)){
				num = Math.round(Math.random()*(max - min) + min);
			}
			return num;
		} else {
			return num;
		}
	}

	// Returns the distance between 2 points in the same coordinate space
	public static function distanceBetween(firstPos:Point, secondPos:Point):Float {
		var dx:Float = firstPos.x - secondPos.x;
		var dy:Float = firstPos.y - secondPos.y;

		return vectorLength(dx, dy);
	}

	// Convert a Float representing an angle in Degrees to a Float representing an angle in Radians
	public static function degreesToRadians(deg:Float):Float {
		return deg * (Math.PI / 180);
	}

	// Convert a Float representing an angle in Radians to a Float representing an angle in Degrees
	public static function radiansToDegrees(rad:Float):Float {
		return rad * (180 / Math.PI) + 180;
	}

	// Rounds a Float to a to a number of decimal places
	// Example - roundTo(1.12345, 2) will output 1.12,
	// 			 roundTo(1.12345, 4) will output 1.1234, etc.
	public static function roundTo(num:Float, decimal:Float):Float {
		var precision:Float = Math.pow(10, decimal);
		return Math.round(num * precision) / precision;
	}

	// Return the angle of a line in Radians
	public static function getAngleR(x1:Float, y1:Float, x2:Float, y2:Float):Float {
		var dx:Float = x2 - x1;
		var dy:Float = y2 - y1;

		return Math.atan2(dy, dx);
	}

	// Returns the angle of a line in Degrees
	public static function getAngleD(x1:Float, y1:Float, x2:Float, y2:Float):Float {
		var d:Float = radiansToDegrees(getAngleR(x1, y1, x2, y2));
		return d;
	}

	// Return the amount of numbers after the decimal point in a float
	public static function getDecimals(value:Float):Int {
		var arr:Array<String> = Std.string(value).split(".");
		var dec:Int = 0;

		if (arr.length > 1) {
			dec = arr[1].length;
		}

		return dec;
	}

	// Makes sure a value is within a certain range
	public static function clamp(value:Float, min:Float, max:Float):Float {

		if (max < min) {
			throw "Error: max must be more than min!";
		}

		if (value < min) {
			return min;
		} else if(value > max) {
			return max;
		} else {
			return value;
		}
	}

	// Return a random Boolean value
	// not sure this really belongs in here
	public static function randomBool():Bool {
		if(Math.round(Math.random()) == 0) {
			return true;
		} else {
			return false;
		}
	}

	// Checks to see if a number is Odd or not
	public static function isOdd(value:Int):Bool {
		if (value % 2 == 1) {
			return true;
		} else {
			return false;
		}
	}

	// Checks to see if a number is Even or not
	public static function isEven(value:Int):Bool {
		if (value % 2 == 1) {
			return false;
		} else {
			return true;
		}
	}

	// Checks to see if the value is a prime number or not
	public static function isPrime(value:Int):Bool {
		if(value > 1){
			for(i in 2...value-1){
				if(value % i == 0) {
					return false;
				}
			}
		} else {
			throw "Error: value must be greater than 1!";
		}

		return true;
	}

	// Lists all integers under a certain value
	public static function listPrimesUnder(value:Int):Array<Int> {
		var primes:Array<Int> = new Array<Int>();

		if(value > 1){
			for(i in 2...value) {
				if(isPrime(i)){
					primes.push(i);
				}
			}
		}

		return primes;
	}

	// Return the ratio of 2 values
	// value 1 by value 2
	public static function ratio(value1:Float, value2:Float):Float {
		return value1 / value2;
	}

	// Returns linear interpolated value between Max and Min values
	public static function lerp(min:Float, max:Float, ratio:Float):Float {
		return min + ratio * (max - min);
	}

	// Finds the dot product value of 2 vectors - a and b
	public static function dotProduct(ax:Float, ay:Float, bx:Float, by:Float):Float {
		return ax * bx + ay * by;
	}

	// Returns the Factorial of a number
	public static function factorial(value:Int):Int {
		if (value < 2) {
			return 1;
		}

		return value*factorial(value-1);
	}

	// Finds the length of a vector
	public static function vectorLength(dx:Float, dy:Float):Float {
		return Math.sqrt((dx * dx) + (dy * dy));
	}

	#if flash
	// Convert millimeters to pixel units
	public static function mmToPixels(mm:Float):Float {
		return Capabilities.screenDPI * (mm / 25.4);
	}

	// Convert pixel units to millimeters
	public static function pixelsToMM(pixels:Float):Float {
		return (pixels / Capabilities.screenDPI) * 25.4;
	}
	#end

	// Generate a fibonacci number
	// If you wanted to get the 5th number in the sequence you'd use fibonacci(5) for example.
	public static function fibonacci(i:Int):Int {
		if (i == 1 || i == 2) {
			return 1;
		} else {

			if (sequence.length - 1 < i) {

				while (sequence.length < i) {
					sequence.push(sequence[sequence.length - 1] + sequence[sequence.length - 2]);
				}

				return sequence[sequence.length - 1];

			} else {
				return sequence[i - 1];
			}
		}

	}

	// Generate the fibonacci sequence up to the specified location
	// fibonacciSequence(5) would return [1, 1, 2, 3, 5] for example
	public static function fibonacciSequence(toPos:Int):Array<Int> {
		// Make sure the sequence is all there
		if(sequence.length - 1 < toPos) {
			fibonacci(toPos);
			return sequence;
		} else {
			if (sequence.length - 1 == toPos) {
				return sequence;
			} else {
				return sequence.slice(0, toPos);
			}
		}
	}

	// Use this to clear out the fibonacci sequence if for some reason it's taking up too much memory
	public static function resetFibSequence():Void {
		sequence = [1, 1];
	}

	// Use this function to generate Sine Waves
	public static function sineWave(startPos:Point, speed:Float, waveHeight:Int, waveLength:Int):Point {
		var p:Point = startPos;

		p.x += speed;
		p.y = (Math.sin(p.x / waveLength) * waveHeight);

		return p;
	}

	// Returns the Area of a Rectangle
	public static function areaOfRectangle(width:Float, height:Float):Float {
		return width * height;
	}

	// Returns the Area of a perfect Circle, no Ellipses!
	public static function areaOfCircle(radius:Float):Float {
		return Math.PI * (radius * radius);
	}

	// Returns the area of an Elipse
	public static function areaOfElipse(bigRadius:Float, smallRadius:Float):Float {
		return Math.PI * (bigRadius * smallRadius);
	}

	// area of a right angle triangle
	// where a and b are the lengths of two lines at right angles to each other
	public static function areaOfRightTriangle(a:Float, b:Float):Float {
		return (a * b) / 2;
	}

	// Returns the Area of a Triangle
	// base = pick a side
	// perpHaight = length to the top of the triangle, at a right angle to the base
	public static function areaOfTriangle(base:Float, perpHeight:Float):Float {
		return (0.5 * base) * perpHeight;
	}

	// Checks to see if a specific float can be located inside an array
	// Used by the Random Float function to determine if the Float is one of the excluded values
	public static function floatInArray(number:Float, array:Array<Float>):Bool {
		var r:Bool = false;

		for (i in 0...array.length) {
			if (array[i] == number) {
				r = true;
			}
		}

		return r;
	}

	// Checks to see if a specific int can be located inside an array
	// Used by the Random Int function to determine if the Int is one of the excluded values
	public static function intInArray(number:Int, array:Array<Int>):Bool {
		var r:Bool = false;

		for (i in 0...array.length) {
			if (array[i] == number) {
				r = true;
			}
		}

		return r;
	}

}
