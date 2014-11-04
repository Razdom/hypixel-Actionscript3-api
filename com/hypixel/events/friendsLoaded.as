package com.hypixel.events {
	import flash.events.Event;

	public class friendsLoaded extends Event {

		private var friends: Array;

		public function friendsLoaded(friends: Array, type = "friendsLoaded") {
			this.friends = friends;
			super(type);
		}
		public function getFriends(): Array {
			return this.friends;
		}
		override public function clone(): Event {
			return new friendsLoaded(friends);
		}
	}

}
