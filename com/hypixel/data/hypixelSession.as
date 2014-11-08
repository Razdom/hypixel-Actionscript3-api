package com.hypixel.data {

	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import com.adobe.serialization.json.JSON;


	public class hypixelSession extends Object {

		private var data: Object = {};

		public function hypixelSession(data: Object): void {
			this.data = data;
		}
		public function id(): String {
			return data['_id'];
		}
		public function gameType(): String {
			return data['gameType'];
		}
		public function players(): Array {
			return data['players'];
		}
		public function server(): String {
			return data['server'];
		}
	}

}
