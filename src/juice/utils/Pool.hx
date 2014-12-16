package juice.utils;

// TODO: Make the Generic Pool work, shouldn't be too hard
// Maybe shouldn't be in utils, but we can move it later 
class Pool<T>
{

	private var pool:Array<T> = [];
	private var size:Int;

	public function new(length:Int){
		size = length;
	}

	public function fill(c:Class<T>):Void {
		while(pool.length < size){
			pool.push(Type.createInstance(c, []));
		}
	}

	public function get():T {
		return pool.shift();
	}

	public function put(thing:T):Void {
		pool.push(thing);
	}
}