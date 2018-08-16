package batoust.games.map;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;

/**
 * ...
 * @author Batoust
 */
class Map
{
	private var _loader:FlxOgmoLoader;
	
	public var _colliders:FlxTypedGroup<FlxObject>;
	public var _seedables:FlxTypedGroup<Seedable>;
	public var _layer0:FlxTilemap;
	public var _layer1:FlxTilemap;
	public var _layer2:FlxTilemap;
	public var _playerSpawn:FlxPoint;
	
	public var tileWidth:Int = 32;
	public var tileHeight:Int = 32;
	public var mapWidth:Int;
	public var mapHeight:Int;
	
	public function new(level:String){
		
		//super();
		
		_loader = new FlxOgmoLoader(level);
		mapWidth = _loader.width;
		mapHeight = _loader.height;
		
		_playerSpawn = new FlxPoint(0, 0);
		_colliders = new FlxTypedGroup<FlxObject>(64);
		_seedables = new FlxTypedGroup<Seedable>(64);
		
		_layer0 = _loader.loadTilemap(AssetPaths.terrain__png, tileWidth, tileHeight, "Layer0");
		_layer0.follow();
		_layer0.setTileProperties(1, FlxObject.NONE);
		_layer0.setTileProperties(2, FlxObject.ANY);
		
		_layer1 = _loader.loadTilemap(AssetPaths.terrain__png, tileWidth, tileHeight, "Layer1");
		_layer1.follow();
		_layer1.setTileProperties(1, FlxObject.NONE);
		_layer1.setTileProperties(2, FlxObject.ANY);
		
		_layer2 = _loader.loadTilemap(AssetPaths.terrain__png, tileWidth, tileHeight, "Layer2");
		_layer2.follow();
		_layer2.setTileProperties(1, FlxObject.NONE);
		_layer2.setTileProperties(2, FlxObject.ANY);
		
		_loader.loadEntities(entityFoundHandler, "Entities");
		_loader.loadRectangles(colliderFoundHandler, "Colliders");
	}
	
	private function entityFoundHandler(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		if (entityName == "Player")
		{
			trace("Player entity found @ " + x + ";" + y);
			_playerSpawn.x = x;
			_playerSpawn.y = y;
		} else if (entityName == "Seedable"){
			trace("Seedable entity found @ " + x + ";" + y);
			
			var seedable = new Seedable(x, y, tileWidth, tileHeight, entityData.get("isWatered") == "True");
			
			seedable.visible = false;
			seedable.immovable = true;
			seedable.solid = false;
			
			_seedables.add(seedable);
		}
	}
	
	private function colliderFoundHandler(rect:FlxRect) :Void {
		
		var rectCollider = new FlxObject(rect.x, rect.y, rect.width, rect.height);
		rectCollider.visible = false;
		rectCollider.immovable = true;
		rectCollider.solid = true;
		
		_colliders.add(rectCollider);
	}
}