package batoust.games.map;

import flixel.FlxObject;
import flixel.math.FlxRect;

/**
 * ...
 * @author Batoust
 */
 
 class Entity extends FlxObject
{
	public var rect:FlxRect;
	
	public function new(x:Int, y:Int, width:Int, height:Int )
	{
		super();
		
		rect = new FlxRect(x, y, width, height);
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}
	
}