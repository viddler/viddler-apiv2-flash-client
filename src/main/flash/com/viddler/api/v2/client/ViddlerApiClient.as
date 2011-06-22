package com.viddler.api.v2.client {
	import com.viddler.api.v2.client.transport.DefaultRequestHelper;
	import com.viddler.api.v2.client.transport.RequestHelper;
	
	
	public class ViddlerApiClient {
		
		public static const API_ENDPOINT:String = 'http://api.viddler.com/api/v2/';
		
		private var apiKey:String;
		
		private var requestHelper:RequestHelper;
		
		private var loggingFunction:Function;
		
		private var _playlists:Playlists;
		
		private var _videos:Videos;
		
		private var apiEndpoint:String;
		
		public function ViddlerApiClient(apiKey:String, apiEndpoint:String = null, loggingFunction:Function = null, requestHelper:RequestHelper = null) {
			this.apiKey = apiKey;
			
			if (apiEndpoint) {
				this.apiEndpoint = apiEndpoint;
			} else {
				this.apiEndpoint = API_ENDPOINT;
			}
			
			if (requestHelper) {
				this.requestHelper = requestHelper;
			} else {
				this.requestHelper = new DefaultRequestHelper(apiEndpoint, apiKey, logger);
			}
			
			this.loggingFunction = loggingFunction;
			
			_playlists = new Playlists(this.requestHelper);
			_videos = new Videos(this.requestHelper);
			
		}
		
		private function logger(msg:String):void {
			if (loggingFunction != null) {
				loggingFunction(msg);
			}
		}
		
		public function get playlists():Playlists {
			return _playlists;
		}
		
		public function get videos():Videos {
			return _videos;
		}
		
	}
}