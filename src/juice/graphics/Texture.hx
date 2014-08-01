package juice.graphics;

// javascript stuff
import js.html.Image;

// my stuff 
import juice.utils.Rectangle;

class Texture
{

	public var image:Image;
	public var bounds:Rectangle;

	public function new(img:Image, ?boundsRect:Rectangle){
		image = img;

		if(boundsRect == null){
			bounds = new Rectangle(0, 0, img.width, img.height);
		} else {
			bounds = boundsRect;
		}
	}

}