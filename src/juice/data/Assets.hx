package juice.data;

// javascript stuff
import js.html.Image;
import js.html.Event;
import js.Lib;

// my stuff
import juice.graphics.Texture;

class Assets
{

	// loaded assets
	public static var textures:Map<String, Texture> = new Map<String, Texture>();

	// assets that have not yet been loaded 
	private static var assetsToLoad:Array<AssetData> = [];

	public static var percent:Int = 0; // how much has loaded?

	private static var toLoad:Int = 0; // how many files are there to load?
	private static var loaded:Int = 0; // how many files have we loaded so far?

	public function new(){
		
	}

	public static function addTexture(name:String, url:String):Void {
		assetsToLoad.push(new AssetData(name, url, "Texture"));
		toLoad ++;
	}

	public static function addSFX(name:String, url:String):Void {
		assetsToLoad.push(new AssetData(name, url, "SFX"));
		toLoad ++;
	}

	public static function addMusic(name:String, url:String):Void {
		assetsToLoad.push(new AssetData(name, url, "Music"));
		toLoad ++;
	}

	public static function addData(name:String, url:String):Void {
		assetsToLoad.push(new AssetData(name, url, "Data"));
		toLoad ++;
	}

	// call this once the assets you want to load have been added 
	// to do the actual loading 
	public static function load():Void {

		for(asset in assetsToLoad) {

			switch (asset.assetType) {
				case "Texture":
					loadTexture(asset);

				case "SFX":
					loadSFX(asset);

				case "Music":
					loadMusic(asset);

				case "Data":
					loadData(asset);
			}
		}
	}

	private static function loadTexture(asset:AssetData):Void {
		// I don't like making this var here
		// but outside of the loop all the textures get set to the same image
		var img:Image = new Image();
		var tex:Texture;

		img.src = asset.url;

		img.onload = function (e:Event) {

			tex = new Texture(img);

			textures.set(asset.name, tex);

			updateProgress();
		};

		img.onerror = function (e:Event) {
			// couldn't find the texture 
			Lib.alert('Error: Couldn\'t load the texture ${asset.url}');
		};
	}

	private static function loadSFX(asset:AssetData):Void {

	}

	private static function loadMusic(asset:AssetData):Void {
		
	}

	private static function loadData(asset:AssetData):Void {
		
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
	public var assetType:String;

	public function new(Name:String, URL:String, AssetType:String){
		name = Name;
		url = URL;
		assetType = AssetType;
	}
}