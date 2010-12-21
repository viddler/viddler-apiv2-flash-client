package com.viddler.api.v2.client.model {
	import com.viddler.api.v2.client.utils.ReflectionToStringBuilder;
	
	
	public class PlaylistResult {
		
		public var playlist:Playlist;
		
		public var videoList:VideoList;
		
		public function toString():String {
			return ReflectionToStringBuilder.toString(this);
		}
		
	}
}