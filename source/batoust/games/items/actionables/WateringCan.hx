package batoust.games.items.actionables;
import batoust.games.PlayState;
import flixel.FlxG;
import source.batoust.games.player.Player;

/**
 * ...
 * @author Batoust
 */
class WateringCan implements IActionable 
{
	private var owner:Player;

	public function new(owner:Player) 
	{
		this.owner = owner;
	}
	
	/* INTERFACE batoust.games.items.actionables.IActionable */
	
	public function Use(actioner:IActioner):Void
	{
		// TODO :
		// Setup an common access to the map tiles nor delegate 
		//if (FlxG.state === PlayState)
			//trace(((PlayState) FlxG.state).map._playerSpawn);
	}
	
	public function CanUse(actioner:IActioner):Bool{
		if (actioner.GetEnergy() > 60)
			return true;
		return false;
	}
	
}