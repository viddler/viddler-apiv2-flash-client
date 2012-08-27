package com.viddler.api.v2.client.model {
	import com.viddler.api.v2.client.utils.ReflectionToStringBuilder;
	import com.viddler.api.v2.client.utils.XMLParser;
	
	
	public class Video {
		
		public var id:String;
		
		public var thumbnailUrl:String;
		
		public var title:String;
		
		public function toString():String {
			return ReflectionToStringBuilder.toString(this);
		}
		
	}
}