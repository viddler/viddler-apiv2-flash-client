package com.viddler.api.v2.client {
	import com.viddler.api.v2.client.utils.ReflectionToStringBuilder;
	
	
	public class PageInfo {
		
		public var page:Number = 0;
		
		public var perPage:Number = 10;
		
		public function PageInfo(page:Number = 0, perPage:Number = 10) {
			this.page = page;
			this.perPage = perPage;
		}
		
		
		public function toString():String {
			return ReflectionToStringBuilder.toString(this).toString();
		}
	}
}