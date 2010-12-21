package com.viddler.api.v2.client.model {
	import com.viddler.api.v2.client.utils.ReflectionToStringBuilder;
	
	
	public class VideoList {
		
		public var videos:Array;
		
		public function toString():String {
			return ReflectionToStringBuilder.toString(this);
		}
		
	}
}