package batoust.games;

import batoust.games.map.Map;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.FlxG;
import source.batoust.games.player.Player;

class PlayState extends FlxState
{
	private var _player:Player;
	public var _map:Map;
	
	override public function create():Void
	{
		super.create();
		
		_map = new Map(AssetPaths.map01__oel);
		add(_map._layer0);
		add(_map._layer1);
		add(_map._layer2);
		add(_map._colliders);
		add(_map._seedables);
		
		_player = new Player(_map._playerSpawn.x, _map._playerSpawn.y, 32, 32);
		add(_player);
		
		FlxG.camera.follow(_player, TOPDOWN, 1);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide(_map._colliders, _player);
	}
}