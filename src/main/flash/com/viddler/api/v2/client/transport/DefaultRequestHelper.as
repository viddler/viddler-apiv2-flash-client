package com.viddler.api.v2.client.transport {
	import com.viddler.api.v2.client.utils.XMLParser;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	
	public class DefaultRequestHelper implements RequestHelper {
		
		private var apiEndpoint:String;
		
		private var sessionId:String;
		
		private var apiKey:String;
		
		private var logger:Function;
		
		public function DefaultRequestHelper(apiEndpoint:String, apiKey:String, logger:Function) {
			this.apiEndpoint = apiEndpoint;
			this.apiKey = apiKey;
			this.logger = logger;
		}
		
		public function get(method:String, result:Object, params:Object, resultListener:Function, errorListener:Function):void {
			request(URLRequestMethod.GET, result, method, params, resultListener, errorListener);
		}
		
		public function post(method:String, result:Object, params:Object, resultListener:Function, errorListener:Function):void {
			request(URLRequestMethod.POST, result, method, params, resultListener, errorListener);
		}
		
		private function request(httpMethod:String, result:Object, method:String, params:Object, resultListener:Function, errorListener:Function):void {
			logger('DefaultRequestHelper.request, httpMethod: ' + httpMethod + 
				', method: ' + method + ', params: ' + params + 
				', resultListener: ' + resultListener + ', errorListener: ' + errorListener);
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(IOErrorEvent.IO_ERROR, function(event:IOErrorEvent):void {
				logger('error, event: ' + event);
				errorListener(event.text);
			});
			
			loader.addEventListener(Event.COMPLETE, function(event:Event):void {				
				XMLParser.parse(new XML(loader.data), result);
				resultListener(result);
			});
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function(event:SecurityErrorEvent):void {
				errorListener(event.text);
				logger('error, message: ' + event.text);
			});
			var url:String = constructUrl(method, params);
			logger('DefaultRequestHelper.request, url: ' + url);
			var request:URLRequest = new URLRequest(url);
			request.method = httpMethod;
			loader.load(request);
		}
		
		
		//GET /api/v2/viddler.playlists.getDetails.xml?sessionid=370310512d04837eb747415241523c0&key=21c01df11b8ec675ce4741524152142&playlist_id=718a076f7414e6e9&id_only=true&page=1
		private function constructUrl(method:String, params:Object):String {
			var url:String = apiEndpoint + method + '.xml?';
			var newParams:Array = [];
			for (var name:String in params) {
				newParams.push(escape(name) + '=' + escape(params[name]));
			}
			newParams.unshift(escape('key') + '=' + escape(apiKey));
			if (sessionId) {
				newParams.unshift(escape('sessionid') + '=' + escape(sessionId));
			}
			return url + newParams.join('&');
		}
	}
}