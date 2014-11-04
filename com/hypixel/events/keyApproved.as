package com.hypixel.events {
	import flash.events.Event;
	import com.hypixel.data.hypixelPlayer;

	public class keyApproved extends Event {

		public function keyApproved(type = "keyApproved") {
			super(type);
		}
		override public function clone(): Event {
			return new keyApproved();
		}
	}

}
