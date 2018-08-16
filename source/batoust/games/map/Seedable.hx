package batoust.games.map;
import flixel.math.FlxPoint;

/**
 * ...
 * @author Batoust
 */
class Seedable extends Entity 
{
	public var isWatered:Bool;
	
	public function new(x:Int, y:Int, width:Int, height:Int, isWatered:Bool) 
	{
		super(x, y, width, height);
		this.isWatered = isWatered;
	}
	
	public function getCenterPos():FlxPoint{
		return new FlxPoint(x + width / 2, y + height/2);
	}
	
}