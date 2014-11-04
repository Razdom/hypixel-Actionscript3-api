package com.hypixel.events {
	import flash.events.Event;
	import com.hypixel.data.hypixelPlayer;

	public class playerLoaded extends Event {

		private var player: hypixelPlayer;

		public function playerLoaded(player: hypixelPlayer, type = "playerLoaded") {
			this.player = player;
			super(type);
		}
		public function getPlayer(): hypixelPlayer {
			return this.player;
		}
		override public function clone(): Event {
			return new playerLoaded(player);
		}
	}

}
