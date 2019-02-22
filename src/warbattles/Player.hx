package warbattles;

import lua.Table;
import defold.Factory;
import Defold.hash;
import defold.types.Hash;
import defold.support.ScriptOnInputAction;
import defold.Go;
import defold.Vmath;
import defold.types.Vector3;
import defold.Msg;

typedef PlayerData = {
	var moving:Bool;
	var firing:Bool;
	var input:Vector3;
	var dir:Vector3;
	var speed:Int;
}

class Player extends defold.support.Script<PlayerData> {

	override function init(self:PlayerData) {
		Msg.post(".", GoMessages.acquire_input_focus);
		self.moving = false;
		self.firing = false;
		self.input = Vmath.vector3();
		self.dir = Vmath.vector3(0, 1, 0);
		self.speed = 50;
	}

	override function final_(self:PlayerData) {
		Msg.post(".", GoMessages.release_input_focus);
	}

	override function update(self:PlayerData, dt:Float) {
		if (self.moving) {
			var pos = Go.get_position();
			pos = pos + self.dir * self.speed * dt;
			Go.set_position(pos);
		}

		if (self.firing) {
			var angle = Math.atan2(self.dir.y, self.dir.x);
			var rot = Vmath.quat_rotation_z(angle);
			var props = Table.create();
			props.dir = self.dir;
			Factory.create("#rocketfactory", null, rot, props);
		}

		self.input.x = 0;
		self.input.y = 0;
		self.moving = false;
		self.firing = false;
	}

	override function on_input(self:PlayerData, action_id:Hash, action:ScriptOnInputAction):Bool {
		if (action_id == hash("up")) {
			self.input.y = 1;
		} else if (action_id == hash("down")) {
			self.input.y = -1;
		} else if (action_id == hash("left")) {
			self.input.x = -1;
		} else if (action_id == hash("right")) {
			self.input.x = 1;
		} else if (action_id == hash("fire") && action.pressed) {
			self.firing = true;
		}

		if (Vmath.length(self.input) > 0) {
			self.moving = true;
			self.dir = Vmath.normalize(self.input);
		}

		return false;
	}
}
