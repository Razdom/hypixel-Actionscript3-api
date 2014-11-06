package com.hypixel {

	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import com.adobe.serialization.json.JSON;
	import com.hypixel.data.*;
	import com.hypixel.events.*;

	public class hypixelAPI extends MovieClip {

		private var URL_BASE: String = "https://api.hypixel.net/";
		private var apiKey: String = "";
		private var debug: Boolean = false;
		private var approvedKey: Boolean = false;
		private var keyData: Object = {};
		private var players: Array = [];
		private var guilds: Array = [];


		public function hypixelAPI(debug: Boolean = false): void {
			this.debug = debug;
			debugTrace("hypixel api enable!");
		}
		public function loadKey(apiKey: String) {
			if(apiKey != null) {
				this.apiKey = apiKey;
				getKeyInfo();
			}
		}
		public function getApiOwner(): String {
			if(approvedKey) {
				return keyData['owner'];
			} else {
				return "";
			}
		}
		public function loadGuildById(id: String) {
			if(approvedKey) {
				var loader: URLLoader = new URLLoader();
				var request: URLRequest = new URLRequest(URL_BASE + "guild?key=" + this.apiKey + "&id=" + id);
				loader.addEventListener(Event.COMPLETE, getGuildData);
				loader.load(request);
			}
		}
		public function loadGuildByName(name: String) {
			if(approvedKey) {
				var loader: URLLoader = new URLLoader();
				var request: URLRequest = new URLRequest(URL_BASE + "findGuild?key=" + this.apiKey + "&byName=" + name);
				loader.addEventListener(Event.COMPLETE, getFindGuildData);
				loader.load(request);
			}
		}
		public function loadGuildByPlayerName(name: String) {
			if(approvedKey) {
				var loader: URLLoader = new URLLoader();
				var request: URLRequest = new URLRequest(URL_BASE + "findGuild?key=" + this.apiKey + "&byPlayer=" + name);
				loader.addEventListener(Event.COMPLETE, getFindGuildData);
				loader.load(request);
			}
		}
		public function loadPlayerByName(name: String) {
			if(approvedKey) {
				var loader: URLLoader = new URLLoader();
				var request: URLRequest = new URLRequest(URL_BASE + "player?key=" + this.apiKey + "&name=" + name);
				loader.addEventListener(Event.COMPLETE, getPlayerData);
				loader.load(request);
			}
		}
		public function loadPlayerByUUID(uuid: String) {
			if(approvedKey) {
				var loader: URLLoader = new URLLoader();
				var request: URLRequest = new URLRequest(URL_BASE + "player?key=" + this.apiKey + "&uuid=" + uuid);
				loader.addEventListener(Event.COMPLETE, getPlayerData);
				loader.load(request);
			}
		}
		public function loadFriendsByName(name: String) {
			if(approvedKey) {
				var loader: URLLoader = new URLLoader();
				var request: URLRequest = new URLRequest(URL_BASE + "friends?key=" + this.apiKey + "&player=" + name);
				loader.addEventListener(Event.COMPLETE, getFriends);
				loader.load(request);
			}
		}
		public function getPlayer(name: String) {
			return players[name.toLocaleLowerCase()];
		}
		public function getGuilds(name: String) {
			return guilds[name.toLocaleLowerCase()];
		}
		private function getKeyInfo(): void {
			var loader: URLLoader = new URLLoader();
			var request: URLRequest = new URLRequest(URL_BASE + "key?key=" + this.apiKey);
			loader.addEventListener(Event.COMPLETE, getKeyData);
			loader.load(request);
		}
		private function getKeyData(evt: Event): void {
			var data: Object = jsonDecode(evt.target.data);
			if(data['success'] && data['record'] != null) {
				debugTrace("key approved!");
				keyData = data['record'];
				approvedKey = true;
				dispatchEvent(new keyApproved());
			} else {
				debugTrace(data['cause']);
			}
		}
		private function getPlayerData(evt: Event): void {
			var data: Object = jsonDecode(evt.target.data);
			if(data['success'] && data['player'] != null) {
				var Name: String = String(data['player']['playername']);
				var Player: hypixelPlayer = new hypixelPlayer(data['player']);
				players[Name.toLocaleLowerCase()] = Player;
				dispatchEvent(new playerLoaded(Player));
				debugTrace("get data of player: " + Name);
			}else{
				dispatchEvent(new playerLoaded(null));
			}
		}
		private function getGuildData(evt: Event): void {
			trace("jhjk");
			var data: Object = jsonDecode(evt.target.data);
			if(data['success'] && data['guild'] != null) {
				var Name: String = data['guild']['name'];
				var Guild: hypixelGuild = new hypixelGuild(data['guild']);
				guilds[Name.toLocaleLowerCase()] = Guild;
				dispatchEvent(new guildLoaded(Guild));
				debugTrace("get data of guild: " + Name);
			}
		}
		private function getFindGuildData(evt: Event): void {
			var data: Object = jsonDecode(evt.target.data);
			if(data['success'] && data['guild'] != null) {
				this.loadGuildById(data['guild']);
				debugTrace("get data of guild id: " + data['guild']);
			} else {
				dispatchEvent(new guildLoaded(null));
			}
		}
		private function getFriends(evt: Event): void {
			var data: Object = jsonDecode(evt.target.data);
			if(data['success'] && data['records'] != null) {
				dispatchEvent(new friendsLoaded(data['records']));
				debugTrace("friends loaded.");
			}
		}
		private function debugTrace(text: String): void {
			if(this.debug)
				trace(text);
		}
		private function jsonDecode(data: String): Object {
			return com.adobe.serialization.json.JSON.decode(data);
		}
	}

}
