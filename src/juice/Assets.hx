package juice;

// javascript stuff
import js.html.Image;

// my stuff
import juice.graphics.Texture;

class Assets
{

	// loaded assets
	public static var textures:Map<String, Texture> = new Map<String, Texture>();

	// assets that have not yet been loaded 
	private static var texturesToLoad:Array<AssetData> = new Array<AssetData>();

	public function new(){
		
	}

	public static function addTexture(name:String, url:String):Void {
		texturesToLoad.push(new AssetData(name, url));
	}

	public static function addSFX():Void {

	}

	public static function addMusic():Void {
		
	}

	public static function addData():Void {
		
	}

	// call this once the assets you want to load have been added 
	// to do the actual loading 
	public static function load():Void {
		// load textures
		var tex:Texture;
		var name:String;

		var img:Image;

		for(i in texturesToLoad.length...0) {
			img = new Image();
			img.src = texturesToLoad[i].url;

			tex = new Texture(img);
			name = texturesToLoad[i].name;

			textures.set(name, tex);

			texturesToLoad.pop();
		}
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