package com.hypixel.events {

	import flash.events.Event;
	import com.hypixel.objects.hypixelSession;

	public class boostersLoaded extends Event {

		private var Boosters: Array;

		public function boostersLoaded(Boosters: Array, type = "boostersLoaded") {
			this.Boosters = Boosters;
			super(type);
		}
		public function getBoosters(): Array {
			return this.Boosters;
		}
		override public function clone(): Event {
			return new boostersLoaded(Boosters);
		}
	}

}
