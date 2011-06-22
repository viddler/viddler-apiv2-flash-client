package {
	import com.viddler.api.v2.client.ViddlerApiClient;
	
	import flash.display.Sprite;
	
	public class Main extends Sprite {
		
		private static const API_KEY:String = CONFIG::key;
		private static const API_ENDPOINT:String = CONFIG::endpoint;
		
		private var client:ViddlerApiClient;
		
		public function Main() {
			client = new ViddlerApiClient(API_KEY, API_ENDPOINT, clientLog);
			//client.playlists.getDetails('7a87326c7717e5ea', onPlaylistsGetDetailsResult, onPlaylistsGetDetailsError, true);
			//client.videos.getEmbedCodeTypes(onResult,onError);
			client.videos.getEmbedCode(onResult,onError,'c51d2ea8',4);
		}
		
		private function onResult(res:Object):void {
			trace('result:' + res);			
		}
		
		private function onError(err:Object):void {
			trace('error:' + err);			
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