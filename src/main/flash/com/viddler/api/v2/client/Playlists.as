package com.viddler.api.v2.client {
	import com.viddler.api.v2.client.model.PlaylistResult;
	import com.viddler.api.v2.client.transport.RequestHelper;
	
	
	public class Playlists {
		
		private var requestHelper:RequestHelper;
		
		
		public function Playlists(requestHelper:RequestHelper) {
			this.requestHelper = requestHelper;
		}
		
		public function getDetails(playlistId:String, idOnly:Boolean, resultListener:Function, errorListener:Function):void {
			requestHelper.get('viddler.playlists.getDetails', 
				new PlaylistResult(), 
				{'playlist_id' : playlistId, 'id_only' : idOnly}, 
				resultListener, errorListener); 			
		}
		
	}
}