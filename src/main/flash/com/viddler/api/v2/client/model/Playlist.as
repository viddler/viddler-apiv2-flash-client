package com.viddler.api.v2.client.model {
	import com.viddler.api.v2.client.utils.ReflectionToStringBuilder;
	import com.viddler.api.v2.client.utils.ToStringBuilder;
	import com.viddler.api.v2.client.utils.XMLParser;
	
	
	public class Playlist {
		
		public var id:String;
		
		public var name:String;
		
		public var type:String;
		
		public var visibility:String;
		
		public var user:String;
		
		public function toString():String {
			return ReflectionToStringBuilder.toString(this);
		}
	}
}