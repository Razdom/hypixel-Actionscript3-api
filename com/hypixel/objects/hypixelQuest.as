package com.hypixel.objects {

	public class hypixelQuest extends Object {

		private var nameQuest: String;
		private var data: Object = {};

		public function hypixelQuest(name: String, data: Object): void {
			this.nameQuest = name;
			this.data = data;
		}
		public function name(): String {
			return this.nameQuest;
		}
		public function completions(): Array {
			return data['completions'];
		}
		public function active(): Object {
			return data['active'];
		}
	}

}
