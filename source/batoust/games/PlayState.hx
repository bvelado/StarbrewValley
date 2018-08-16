package batoust.games;

import batoust.games.map.Map;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.util.FlxColor;
import source.batoust.games.player.Player;

class PlayState extends FlxState
{
	private var _player:Player;
	public var _map:Map;
	
	private var _posInFrontOfPlayer:FlxPoint;
	private var _debugSprite:FlxObject;
	
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
		
		_debugSprite = new FlxSprite(0, 0).makeGraphic(_map.tileWidth, _map.tileHeight, 0x99D1603D);
		add(_debugSprite);
		
		_posInFrontOfPlayer = new FlxPoint();
		
		FlxG.camera.follow(_player, TOPDOWN, 1);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (_player.direction == FlxObject.UP) {
			_posInFrontOfPlayer = new FlxPoint(_player.x, _player.y - _map.tileHeight/2);
		} else if (_player.direction == FlxObject.DOWN) {
			_posInFrontOfPlayer = new FlxPoint(_player.x, _player.y + _map.tileHeight/2);
		} else if (_player.direction == FlxObject.LEFT) {
			_posInFrontOfPlayer = new FlxPoint(_player.x - _map.tileWidth/2, _player.y);
		} else if (_player.direction == FlxObject.RIGHT) {
			_posInFrontOfPlayer = new FlxPoint(_player.x + _map.tileWidth/2, _player.y);
		}
		
		_debugSprite.x = Math.round(_posInFrontOfPlayer.x / _map.tileWidth) * _map.tileWidth;
		_debugSprite.y = Math.round(_posInFrontOfPlayer.y / _map.tileHeight) * _map.tileHeight;
		
		FlxG.collide(_map._colliders, _player);
	}
	
	public function TryToUseItemInFrontOfPlayer():FlxObject {
		
		//var it = _map._seedables.iterator(return true);
		for (seedable in _map._seedables){
			//var tile:FlxObject = i;
			//var tileRect:FlxRect = new FlxRect(tile.x, tile.y, tile.width, tile.height);
			if (seedable.rect.containsPoint(_posInFrontOfPlayer)){
				trace(seedable);
				return seedable;
			}
		}
		
		return null;		
	}
}