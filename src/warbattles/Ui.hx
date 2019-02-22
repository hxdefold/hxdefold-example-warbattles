package warbattles;

import defold.Gui;
import defold.types.Message;
import defold.types.Url;

typedef UiData = {
	var score:Int;
}

class Ui extends defold.support.GuiScript<UiData> {
	public static var add_score(default,never) = new Message<{score:Int}>("add_score");

	override function init(self:UiData) {
		self.score = 0;
	}

	override function on_message<TMessage>(self:UiData, message_id:Message<TMessage>, message:TMessage, sender:Url) {
		switch message_id {
			case add_score:
				self.score += message.score;
				var scorenode = Gui.get_node("score");
				Gui.set_text(scorenode, "SCORE: " + self.score);
		}
	}
}
