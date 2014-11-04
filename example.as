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
			HypixelApi.loadKey("64bd424e-ccb0-42ed-8b66-6e42a135afb4");
		}
		private function KeyApproved(evt: keyApproved): void {
			HypixelApi.loadPlayerByName("codename_b");
		}
		private function showPlayerDatis(evt: playerLoaded): void {
			var player: hypixelPlayer = evt.getPlayer();
			trace("Hi " + player.displayName());
			trace("You kill " + player.stats(statsTypes.Walls3)['kills'] + " players in mega walls");
		}
	}

}
