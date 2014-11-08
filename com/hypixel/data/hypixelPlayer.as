package com.hypixel.data {

	public class hypixelPlayer extends Object {

		private var data: Object = {};

		public function hypixelPlayer(data: Object): void {
			this.data = data;
		}
		public function id(): String {
			return data['_id'];
		}
		public function playerName(): String {
			return data['playername'];
		}
		public function displayName(): String {
			return data['displayname'];
		}
		public function uuid(): String {
			return data['uuid'];
		}
		public function rank(): String {
			return data['rank'];
		}
		public function chat(): Boolean {
			return data['chat'];
		}
		public function stoggle(): Boolean {
			return data['stoggle'];
		}
		public function gore(): Boolean {
			return data['gore'];
		}
		public function silence(): Boolean {
			return data['silence'];
		}
		public function vanished(): Boolean {
			if(data['vanished'] != null) {
				return data['vanished'];
			} else {
				return false;
			}
		}
		public function packageRank(): String {
			if(data['newPackageRank'] != null) {
				return data['newPackageRank'];
			} else if(data['packageRank'] != null) {
				return data['packageRank'];
			} else {
				return "guest";
			}
		}
		public function prefix(): String {
			return data['prefix'];
		}
		public function mutedTime(): Boolean {
			return data['mutedTime'];
		}
		public function firstLogin(): Number {
			return data['firstLogin'];
		}
		public function lastLogin(): Number {
			return data['lastLogin'];
		}
		public function eulaCoins(): Boolean {
			if(data['eulaCoins'] != null) {
				return data['eulaCoins'];
			} else {
				return false;
			}
		}
		public function karma(): int {
			return data['karma'];
		}
		public function networkLevel(): int {
			return data['networkLevel'] + 1;
		}
		public function networkExp(): int {
			return data['networkExp'];
		}
		public function vanityTokens(): int {
			return data['vanityTokens'];
		}
		public function tournamentTokens(): int {
			return data['tournamentTokens'];
		}
		public function timePlaying(): int {
			return data['timePlaying'];
		}
		public function channel(): String {
			return data['channel'];
		}
		public function testPass(): String {
			return data['testPass'];
		}
		public function quests(): Object {
			return data['quests'];
		}
		public function clock(): Boolean {
			return data['clock'];
		}
		public function achievements(): Object {
			return data['achievements'];
		}
		public function achievementsOneTime(): Object {
			return data['achievementsOneTime'];
		}
		public function fireworkStorage(): Object {
			return data['fireworkStorage'];
		}
		public function mostRecentMinecraftVersion(): int {
			return data['mostRecentMinecraftVersion'];
		}
		public function thanksSent(): int {
			if(data['thanksSent'] != null) {
				return data['thanksSent'];
			} else {
				return 0;
			}
		}
		public function thanksReceived(): int {
			if(data['thanksReceived'] != null) {
				return int(data['thanksReceived']);
			} else {
				return 0;
			}
		}
		public function tipReceived(): int {
			if(data['tipReceived'] != null) {
				return int(data['tipReceived']);
			} else {
				return 0;
			}
		}
		public function tipsSent(): int {
			if(data['tipsSent'] != null) {
				return data['tipsSent'];
			} else {
				return 0;
			}
		}
		public function spectators_invisible(): Boolean {
			return data['spectators_invisible'];
		}
		public function spec_speed(): int {
			return data['spec_speed'];
		}
		public function spec_night_vision(): Boolean {
			return data['spec_night_vision'];
		}
		public function mostRecentlyThanked(): Boolean {
			return data['mostRecentlyThanked'];
		}
		public function mostRecentlyTipped(): String {
			return data['mostRecentlyTipped'];
		}
		public function mostRecentGameType(): String {
			return data['mostRecentGameType'];
		}
		public function vanityMeta(): Array {
			return data['vanityMeta']['packages'];
		}
		public function wardrobe(): String {
			return data['wardrobe'];
		}
		public function gadget(): String {
			return data['gadget'];
		}
		public function customFilter(): String {
			return data['customFilter'];
		}
		public function friendRequests(): Array {
			return data['friendRequests'];
		}
		public function petActive(): Boolean {
			return data['petActive'];
		}
		public function auto_spawn_pet(): Boolean {
			return data['auto_spawn_pet'];
		}
		public function newClock(): String {
			return data['newClock'];
		}
		public function particles(): String {
			return data['pp'];
		}
		public function fly(): Boolean {
			if(data['fly'] != null) {
				return data['fly'];
			} else {
				return false;
			}
		}
		public function packages(): Array {
			return data['packages'];
		}
		public function parkourCompletions(): Object {
			return data['parkourCompletions'];
		}
		public function guildNotifications(): Boolean {
			return data['guildNotifications'];
		}
		public function knownAliases(): Array {
			return data['knownAliases'];
		}
		public function seeRequests(): Boolean {
			return data['seeRequests'];
		}
		public function stats(type: String): Object {
			if(data['stats'][type] != null) {
				return data['stats'][type];
			} else {
				return {};
			}
		}
	}

}
