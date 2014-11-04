package com.hypixel.events {
	import flash.events.Event;
	import com.hypixel.data.hypixelGuild;

	public class guildLoaded extends Event {

		private var guild: hypixelGuild;

		public function guildLoaded(guild: hypixelGuild, type = "guildLoaded") {
			this.guild = guild;
			super(type);
		}
		public function getGuild(): hypixelGuild {
			return this.guild;
		}
		override public function clone(): Event {
			return new guildLoaded(guild);
		}
	}

}
