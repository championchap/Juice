package juice.graphics;

// javascript stuff 
import js.html.Image;

// my stuff 
import juice.geometry.Rectangle;
import juice.geometry.Point;
import juice.utils.NumberTools;

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

	public static function drawImage(image:Image, cropX:Float, cropY:Float, cropWidth:Float, cropHeight:Float, x:Float, y:Float, width:Float, height:Float, rotation:Float, scale:Point):Void {
		Juice.canvasCTX.save();
		
		Juice.canvasCTX.translate(x, y);
		Juice.canvasCTX.scale(scale.x, scale.y);
		Juice.canvasCTX.rotate(NumberTools.degreesToRadians(rotation));

		Juice.canvasCTX.drawImage(
			image,
			cropX,
			cropY,
			cropWidth,
			cropHeight,
			0,
			0,
			width,
			height
		);

		Juice.canvasCTX.restore();
	}

}