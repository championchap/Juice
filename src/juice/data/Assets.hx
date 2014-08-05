package juice.data;

// javascript stuff
import js.html.Image;
import js.html.Event;

// my stuff
import juice.data.Texture;

class Assets
{

	// loaded assets
	public static var textures:Map<String, Texture> = new Map<String, Texture>();

	// assets that have not yet been loaded 
	private static var texturesToLoad:Array<AssetData> = new Array<AssetData>();

	public static var percent:Int = 0; // how much has loaded?

	private static var toLoad:Int = 0; // how many files are there to load?
	private static var loaded:Int = 0; // how many files have we loaded so far?

	public function new(){
		
	}

	public static function addTexture(name:String, url:String):Void {
		texturesToLoad.push(new AssetData(name, url));
		toLoad ++;
	}

	public static function addSFX():Void {
		toLoad ++;
	}

	public static function addMusic():Void {
		toLoad ++;
	}

	public static function addData():Void {
		toLoad ++;
	}

	// call this once the assets you want to load have been added 
	// to do the actual loading 
	public static function load():Void {
		// load textures
		var tex:Texture;
		var name:String;

		for(i in 0...texturesToLoad.length) {
			// I don't like making this var here
			// but outside of the loop all the textures get set to the same image
			var img:Image = new Image();

			img.src = texturesToLoad[i].url;

			img.onload = function (e:Event) {

				tex = new Texture(img);
				name = texturesToLoad[i].name;

				textures.set(name, tex);

				updateProgress();

			}
		}
	}

	private static function updateProgress():Void {
		loaded ++;

		percent = Std.int((loaded / toLoad) * 100);
	}
}

class AssetData
{
	public var name:String;
	public var url:String;

	public function new(Name:String, URL:String){
		name = Name;
		url = URL;
	}
}