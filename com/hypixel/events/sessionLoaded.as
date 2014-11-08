package com.hypixel.events {
	
	import flash.events.Event;
	import com.hypixel.data.hypixelSession;

	public class sessionLoaded extends Event {

		private var Session: hypixelSession;

		public function sessionLoaded(Session: hypixelSession, type = "sessionLoaded") {
			this.Session = Session;
			super(type);
		}
		public function getSession(): hypixelSession {
			return this.Session;
		}
		override public function clone(): Event {
			return new sessionLoaded(Session);
		}
	}

}
