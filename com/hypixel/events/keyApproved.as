package com.hypixel.events {
	import flash.events.Event;
	import com.hypixel.data.hypixelPlayer;

	public class keyApproved extends Event {
		
		private var Approved:Boolean;

		public function keyApproved(Approved:Boolean,type = "keyApproved") {
			this.Approved = Approved;
			super(type);
		}
		public function getApproved(): Boolean {
			return this.Approved;
		}
		override public function clone(): Event {
			return new keyApproved(Approved);
		}
	}

}
