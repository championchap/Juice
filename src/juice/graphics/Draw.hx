package juice.graphics;

// javascript stuff 
import js.html.Image;

// my stuff 
import juice.geometry.Rectangle;
import juice.geometry.Point;
import juice.utils.NumberTools;

// This is where we actually do all of the drawing to the canvas context 
// Don't to any of your own drawing, use this instead 
class Draw
{
	public function new(){
		
	}

	public static function filledRect(rect:Rectangle, colour:String = "#ffffff"):Void {
		Juice.canvasCTX.fillStyle = colour;
		Juice.canvasCTX.fillRect(rect.x, rect.y, rect.width, rect.height);
	}

	public static function filledCircle(position:Point, radius:Float, colour:String = "#ffffff"):Void {
		Juice.canvasCTX.fillStyle = colour;
		Juice.canvasCTX.beginPath();
		Juice.canvasCTX.arc(position.x, position.y, radius, 0, Math.PI*2, false);
		Juice.canvasCTX.closePath();
		Juice.canvasCTX.fill();
	}

	public static function image(image:Image, cropX:Float, cropY:Float, cropWidth:Float, cropHeight:Float, x:Float, y:Float, width:Float, height:Float, rotation:Float, scale:Point):Void {
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

	public static function line(from:Point, to:Point, colour:String, thickness:Float):Void {
		Juice.canvasCTX.beginPath(); // This is important, previously drawn lines don't get cleared without it!
		Juice.canvasCTX.strokeStyle = colour;
		Juice.canvasCTX.lineWidth = thickness;
		Juice.canvasCTX.moveTo(from.x, from.y);
		Juice.canvasCTX.lineTo(to.x, to.y);
		Juice.canvasCTX.stroke();
	}

	// TODO: text origin seems to be set to bottom left, should try and make it top left 
	// A combined Stroke and Fill text function 
	public static function text(text:String, font:String, size:String, strokeThickness:Float, position:Point, fillColour:String, strokeColour:String):Void {
		fillText(text, font, size, position, fillColour);
		strokeText(text, font, size, strokeThickness, position, strokeColour);
	}

	public static function fillText(text:String, font:String, size:String, position:Point, colour:String):Void {
		Juice.canvasCTX.fillStyle = colour;
		Juice.canvasCTX.font = '$size $font';
		Juice.canvasCTX.fillText(text, position.x, position.y);
	}

	public static function strokeText(text:String, font:String, size:String, thickness:Float, position:Point, colour:String):Void {
		Juice.canvasCTX.strokeStyle = colour;
		Juice.canvasCTX.lineWidth = thickness;
		Juice.canvasCTX.font = '$size $font';
		Juice.canvasCTX.strokeText(text, position.x, position.y);
	}

}