package juice.core;

// Group should probably use Pool internally?
// Should also allow us to do things like collisions 
class Group
{

	// There is no Basic Object that other stuff extends in Juice
	// So maybe the solution can be found in this article about using enums for mixed type iterables
	// http://old.haxe.org/doc/cross/more_on_enum?lang=en

	// Making this Dynamic for now, just because it's easier 
	private var members:Array<Dynamic> = [];

	public function new(){
		
	}

	// Add a new Member to the Group 
	public function add():Void {

	}

	// Remove an existing Member from the Group
	public function remove():Void {

	}

	public function start():Void {

	}

	public function end():Void {

	}

	public function update():Void {

	}

	public function render():Void {

	}

	public function destroy():Void {

	}

}