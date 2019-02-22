package warbattles;

import defold.Physics.PhysicsMessages;
import defold.types.Message;
import defold.types.Url;
import Defold.hash;
import defold.Sprite.SpriteMessages;
import defold.Msg;
import defold.Vmath;
import defold.Go;
import defold.types.Vector3;

typedef RocketData = {
	@property var dir:Vector3;
	var speed:Int;
	var life:Float;
}

class Rocket extends defold.support.Script<RocketData> {
	override function init(self:RocketData) {
		self.speed = 200;
		self.life = 1;
	}

	function explode(self:RocketData) {
		self.life = 1000;
		Go.set_rotation(Vmath.quat());
		self.speed = 0;
		Msg.post("#sprite", SpriteMessages.play_animation, {id: hash("explosion")});
	}

	override function update(self:RocketData, dt:Float) {
		var pos = Go.get_position();
		pos = pos + self.dir * self.speed * dt;
		Go.set_position(pos);

		self.life -= dt;
		if (self.life < 0) {
			explode(self);
		}
	}

	override function on_message<TMessage>(self:RocketData, message_id:Message<TMessage>, message:TMessage, sender:Url) {
		switch message_id {
			case SpriteMessages.animation_done:
				Go.delete();
			case PhysicsMessages.collision_response:
				explode(self);
				Go.delete(message.other_id);
				Msg.post("/gui#ui", Ui.add_score, {score: 100});
		}
	}
}
