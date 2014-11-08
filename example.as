package {

	import flash.display.MovieClip;
	import com.hypixel.*;
	import com.hypixel.data.*;
	import com.hypixel.events.*;

	public class example extends MovieClip {

		public var HypixelApi: hypixelAPI;

		public function example() {
			HypixelApi = new hypixelAPI(false);
			HypixelApi.addEventListener(Events.keyApproved, KeyApproved);
			HypixelApi.addEventListener(Events.playerLoaded, showPlayerDatis);
			HypixelApi.loadKey("xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
		}
		private function KeyApproved(evt: keyApproved): void {
			if(evt.getApproved())
				HypixelApi.loadPlayerByName("codename_b");
		}
		private function showPlayerDatis(evt: playerLoaded): void {
			var player: hypixelPlayer = evt.getPlayer();
			if(player != null){
				trace("Hi " + player.displayName()+"!");
				trace("You killed " + player.stats(statsTypes.Walls3)['kills'] + " players on mega walls.");
			}
		}
	}

}
