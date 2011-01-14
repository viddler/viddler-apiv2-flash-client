package com.viddler.api.v2.client {
	import com.viddler.api.v2.client.model.PlaylistResult;
	import com.viddler.api.v2.client.transport.RequestHelper;
	
	
	public class Playlists {
		
		private var requestHelper:RequestHelper;
		
		
		public function Playlists(requestHelper:RequestHelper) {
			this.requestHelper = requestHelper;
		}
		
		public function getDetails(playlistId:String, resultListener:Function, errorListener:Function, idOnly:Boolean = false, pageInfo:PageInfo = null):void {
			var params:Object = {'playlist_id' : playlistId, 'id_only' : idOnly};
			if (pageInfo != null) {
				params['page'] = pageInfo.page;
				params['per_page'] = pageInfo.perPage;
			}
			requestHelper.get('viddler.playlists.getDetails', 
				new PlaylistResult(),  params, 
				resultListener, errorListener);
		}
		
	}
}