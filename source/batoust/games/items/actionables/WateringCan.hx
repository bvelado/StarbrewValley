package batoust.games.items.actionables;
import batoust.games.PlayState;
import batoust.games.map.Seedable;
import flixel.FlxG;
import flixel.FlxObject;
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
	
	public function Use(actioner:IUser):Void
	{
		// TODO :
		// Setup an common access to the map tiles nor delegate 
		var seedableInFrontOfPlayer = cast (FlxG.state, PlayState).TryToUseItemInFrontOfPlayer();
		
		if (seedableInFrontOfPlayer != null) {
			trace("Watering tile @" + seedableInFrontOfPlayer.x + ";" + seedableInFrontOfPlayer.y);
		}
	}
	
	private function WaterSeedable(seedable:FlxObject){
		
	}
}