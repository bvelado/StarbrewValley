package batoust.games.map;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.scaleModes.BaseScaleMode;
import flixel.FlxG;

/**
 * ...
 * @author Batoust
 */
class Seedable extends Entity 
{
	public var isWatered:Bool;
	private var _sprite:FlxSprite;
	
	public function new(x:Int, y:Int, width:Int, height:Int, isWatered:Bool)
	{
		super(x, y, width, height);
		this.isWatered = isWatered;
	}
	
	public function Water(){
		
		if (_sprite != null){
			return;
		}
		
		_sprite = new FlxSprite(x, y);
		_sprite.makeGraphic(32, 32, 0xFFFFFFFF);
		_sprite.visible = true;
		_sprite.immovable = true;
		_sprite.solid = false;
		cast (FlxG.state, PlayState).add(_sprite);
		
		trace("Created a sprite for the seedable @" + x + ";" + y);
	}
	
}