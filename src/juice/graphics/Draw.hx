package juice.graphics;

// javascript stuff 
import js.html.Image;

// my stuff 
import juice.geometry.Rectangle;
import juice.geometry.Point;

class Draw
{
	public function new(){
		
	}

	public static function drawFilledRect(rect:Rectangle, colour:String = "#ffffff"):Void {
		Juice.canvasCTX.fillStyle = colour;
		Juice.canvasCTX.fillRect(rect.x, rect.y, rect.width, rect.height);
	}

	public static function drawFilledCircle(position:Point, radius:Float, colour:String = "#ffffff"):Void {
		Juice.canvasCTX.fillStyle = colour;
		Juice.canvasCTX.beginPath();
		Juice.canvasCTX.arc(position.x, position.y, radius, 0, Math.PI*2, false);
		Juice.canvasCTX.closePath();
		Juice.canvasCTX.fill();
	}

	public static function drawImage(image:Image, cropX:Float, cropY:Float, cropWidth:Float, cropHeight:Float, x:Float, y:Float, width:Float, height:Float):Void {
		Juice.canvasCTX.drawImage(
			image,
			cropX,
			cropY,
			cropWidth,
			cropHeight,
			x,
			y,
			width,
			height
		);
	}

}