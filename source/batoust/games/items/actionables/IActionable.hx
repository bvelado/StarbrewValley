package batoust.games.items.actionables;

/**
 * @author Batoust
 */
interface IActionable 
{
	public function Use(actioner:IActioner):Void;
	public function CanUse(actioner:IActioner):Bool;
}