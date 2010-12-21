package {
	import com.viddler.api.v2.client.ViddlerApiClient;
	
	import flash.display.Sprite;
	
	public class Main extends Sprite {
		
		private static const API_KEY:String = '21c01df11b8ec675ce4741524152142';
		
		private var client:ViddlerApiClient;
		
		public function Main() {
			client = new ViddlerApiClient(API_KEY, clientLog);
			client.playlists.getDetails('718a076f7414e6e9', true, onPlaylistsGetDetailsResult, onPlaylistsGetDetailsError); 
		}
		
		private function onPlaylistsGetDetailsResult(result:Object):void {
			trace('result: ' + result);
		}
		
		private function onPlaylistsGetDetailsError(error:Object):void {
			trace('error: ' + error);
		}
		
		public function clientLog(msg:String):void {
			trace('client log:', msg);
		}
	}
}