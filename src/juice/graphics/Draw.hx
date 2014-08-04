package juice.graphics;

// javascript stuff 
import js.html.Image;

// my stuff 
import juice.utils.Rectangle;
import juice.JG;
import juice.utils.Point;

class Draw
{
	public function new(){
		
	}

	public static function drawFilledRect(rect:Rectangle, colour:String = "#ffffff"):Void {
		JG.canvasCTX.fillStyle = colour;
		JG.canvasCTX.fillRect(rect.x, rect.y, rect.width, rect.height);
	}

	public static function drawFilledCircle(position:Point, radius:Float, colour:String = "#ffffff"):Void {
		JG.canvasCTX.fillStyle = colour;
		JG.canvasCTX.beginPath();
		JG.canvasCTX.arc(position.x, position.y, radius, 0, Math.PI*2, false);
		JG.canvasCTX.closePath();
		JG.canvasCTX.fill();
	}

	public static function drawImage(image:Image, cropX:Float, cropY:Float, cropWidth:Float, cropHeight:Float, x:Float, y:Float, width:Float, height:Float):Void {
		JG.canvasCTX.drawImage(
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

	public static function drawImageClipped():Void {
		
	}

}