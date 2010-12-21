package com.viddler.api.v2.client {
	import com.viddler.api.v2.client.transport.DefaultRequestHelper;
	import com.viddler.api.v2.client.transport.RequestHelper;
	
	
	public class ViddlerApiClient {
		
		public static const API_ENDPOINT:String = 'http://api.viddler.com/api/v2/';
		
		private var _apiKey:String;
		
		private var _requestHelper:RequestHelper;
		
		private var loggingFunction:Function;
		
		private var _playlists:Playlists;
		
		public function ViddlerApiClient(apiKey:String, loggingFunction:Function = null, requestHelper:RequestHelper = null) {
			_apiKey = apiKey;
			this.loggingFunction = loggingFunction;
			if (requestHelper) {
				_requestHelper = requestHelper;
			} else {
				_requestHelper = new DefaultRequestHelper(API_ENDPOINT, apiKey, logger);
			}
			_playlists = new Playlists(_requestHelper);
		}
		
		public function get playlists():Playlists {
			return _playlists;
		}
		
		
		public function get apiKey():String {
			return _apiKey;
		}
		
		public function set apiKey(value:String):void {
			if (_apiKey != value) {
				_apiKey = value;
			}
		}
		
		public function get requestHelper():RequestHelper {
			return _requestHelper;
		}
		
		public function set requestHelper(value:RequestHelper):void {
			if (_requestHelper != value) {
				_requestHelper = value;
			}
		}
		
		
		private function logger(msg:String):void {
			if (loggingFunction != null) {
				loggingFunction(msg);
			}
		}
		
	}
}