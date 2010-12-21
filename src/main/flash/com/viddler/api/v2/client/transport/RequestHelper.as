package com.viddler.api.v2.client.transport {
	
	
	public interface RequestHelper {
		
		function get(method:String, result:Object, params:Object, resultListener:Function, errorListener:Function):void; 
		
		function post(method:String, result:Object, params:Object, resultListener:Function, errorListener:Function):void;
		
	}
}