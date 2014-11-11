package com.hypixel.data {

	public class hypixelQuest extends Object {

		private var name: String;
		private var data: Object = {};

		public function hypixelQuest(name: String, data: Object): void {
			this.name = name;
			this.data = data;
		}
		public function name(): String {
			return name;
		}
		public function completions(): Array {
			return data['completions'];
		}
		public function active(): Object {
			return data['active'];
		}
	}

}
