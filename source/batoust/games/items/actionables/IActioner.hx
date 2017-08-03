package batoust.games.items.actionables;
import flixel.math.FlxPoint;

/**
 * @author Batoust
 */
interface IActioner 
{
	public function UseActionable(actionable:IActionable):Void;
	public function GetEnergy():Int;
	public function GetPosition():FlxPoint;
}