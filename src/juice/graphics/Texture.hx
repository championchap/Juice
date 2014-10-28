package juice.graphics;

// javascript stuff
import js.html.Image;

// my stuff 
import juice.geometry.Rectangle;

class Texture
{

	public var image:Image;
	public var bounds:Rectangle;

	public var width(get, null):Float;
	public var height(get, null):Float;

	public function new(img:Image, boundsRect:Rectangle = null){
		image = img;

		if(boundsRect == null){
			bounds = new Rectangle(0, 0, img.width, img.height);
		} else {
			bounds = boundsRect;
		}
	}

	public function subTexture(boundsRect:Rectangle):Texture {
		return new Texture(image, boundsRect);
	}

	private function get_width():Float {
		return bounds.width;
	}

	private function get_height():Float {
		return bounds.height;
	}

}