package source.batoust.games.player;

import batoust.games.items.actionables.IActionable;
import batoust.games.items.actionables.IUser;
import batoust.games.items.actionables.WateringCan;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

/**
 * ...
 * @author Batoust
 */
class Player extends FlxSprite implements IUser
{	
	private var movementSpeed:Float = 200;
	private var tool:IActionable;
	
	public var direction(default, null):UInt;
	
	public function new(X:Float=0, Y:Float=0, W:Float=32, H:Float=32)
	{
		super(X, Y);
		
		makeGraphic(32,32, FlxColor.BLUE);
		drag.x = drag.y = 1600;
		
		setSize(W, H);
		offset.set(0, 0);
		
		tool = new WateringCan(this);
	}
	
	public function handleInput(){
		var _up:Bool = false;
		var _down:Bool = false;
		var _left:Bool = false;
		var _right:Bool = false;
		
		_up = FlxG.keys.anyPressed([UP, W]);
		_down = FlxG.keys.anyPressed([DOWN, S]);
		_left = FlxG.keys.anyPressed([LEFT, A]);
		_right = FlxG.keys.anyPressed([RIGHT, D]);
		
		// Cancels opposed directions movement
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
			
		// If at least one of theses keys was pressed
		if (_up || _down || _left || _right) {
			var mA:Float = 0;
			if (_up)
			{
				mA = -90;
				direction = FlxObject.UP;
				if (_left) {
					mA -= 45;
					direction = FlxObject.LEFT;
				}
				else if (_right) {
					mA += 45;
					direction = FlxObject.RIGHT;
				}
			}
			else if (_down)
			{
				mA = 90;
				direction = FlxObject.DOWN;
				if (_left) {
					mA += 45;
					direction = FlxObject.LEFT;
				}
				else if (_right) {
					mA -= 45;
					direction = FlxObject.RIGHT;
				}
			}
			else if (_left) {
				mA = 180;
				direction = FlxObject.LEFT;
			}
			else if (_right) {
				mA = 0;
				direction = FlxObject.RIGHT;
			}
				
			velocity.set(movementSpeed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
		}
		
		if (FlxG.keys.anyPressed([SPACE])){
			UseActionable(tool);
		}
		
	}
	
	override public function update(elapsed:Float):Void
	{
		handleInput();
		super.update(elapsed);
	}
	
	public function UseActionable(actionable:IActionable):Void {
		actionable.Use(this);
	}
	
	public function GetEnergy():Int {
		return 100;
	}
	
	public function GetPosition():FlxPoint {
		return this.getPosition();
	}
}