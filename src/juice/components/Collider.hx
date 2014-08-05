package juice.components;

import juice.Component;

enum ColliderType
{
	hitBox;
	hitGrid;
}

class Collider extends Component
{

	var type:ColliderType;

	public function new(type:ColliderType){
		super();
		this.visible = false;

		this.type = type;
	}
}