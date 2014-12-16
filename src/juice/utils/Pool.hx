package juice.utils;

// A Simple Object Pooling class
// Creating and destroying objects all the time is hard on the garbage collector
// use this to recycle them 

class Pool<T>
{

	private var pool:Array<T> = [];
	private var size:Int;

	public function new(length:Int){
		size = length;
	}

	// completely fill the pool with instances of this class 
	public function fill(c:Class<T>):Void {
		while(pool.length < size){
			pool.push(Type.createInstance(c, []));
		}
	}

	// pull an instance from the pool
	public function get():T {
		return pool.shift();
	}

	// return an instance back to the pool
	public function put(thing:T):Void {
		pool.push(thing);
	}

	// destroy the pool but leave the size alone for re-filling 
	public function destroy():Void {
		pool = [];
	}
}