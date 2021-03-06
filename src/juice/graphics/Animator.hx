package juice.graphics;

import juice.graphics.Image;
import juice.graphics.Texture;
import juice.geometry.Rectangle;

class Animation {
	public var name:String;
	public var frames:Array<Int>;
	public var fps:Int;
	public var loop:Bool;
	public var currentFrame:Int = 0;

	public function new(name:String, frames:Array<Int>, fps:Int, loop:Bool){
		this.name = name;
		this.frames = frames;
		this.fps = fps;
		this.loop = loop;
	}
}

class Animator extends Image
{

	private var animations:Map<String, Animation> = new Map<String, Animation>();

	public var frame:Int = 0;
	private var isPlaying:Bool = false;

	public var currentName:String = "";

	private var current:Animation;
	public var frameWidth:Int;
	public var frameHeight:Int;

	private var frameTime:Float = 0;

	public function new(texture:Texture, frameWidth:Int, frameHeight:Int){
		super(texture, new Rectangle(0, 0, frameWidth, frameHeight));
		this.frameWidth = frameWidth;
		this.frameHeight = frameHeight;
	}

	public function add(name:String, frames:Array<Int>, fps:Int, loops:Bool = true):Void {
		animations.set(name, new Animation(name, frames, fps, loops));
	}

	public function play(name:String, restart:Bool = false):Void {
		isPlaying = true;

		current = animations.get(name);
		currentName = name;

		if(restart) {
			current.currentFrame = 0;
		}

	}

	public function stop():Void {
		isPlaying = false;
	}

	override public function update():Void {
		super.update();

		if(isPlaying) {

			frameTime += (1 / Juice.frameRate);

			if(frameTime >= (1 / current.fps)) {
				if(current.currentFrame < current.frames.length -1) {
					current.currentFrame ++;
				} else {
					if(current.loop == true) {
						current.currentFrame = 0;
					}
					
				}

				frameTime -= (1 / current.fps);
			}
		}
	}

	override public function render():Void {
		var colls:Int = Math.floor(texture.width / frameWidth);
		
		var coll:Int = Math.floor(current.currentFrame % colls);
		var row:Int = Math.floor(current.currentFrame / colls);

		bounds.x = coll * frameWidth;
		bounds.y = row * frameHeight;
		bounds.width = frameWidth;
		bounds.height = frameHeight;

		super.render();
	}
}