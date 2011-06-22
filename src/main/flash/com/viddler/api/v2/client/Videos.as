package com.viddler.api.v2.client {
	import com.viddler.api.v2.client.model.EmbedCodeResult;
	import com.viddler.api.v2.client.model.EmbedCodeTypesResult;
	import com.viddler.api.v2.client.transport.RequestHelper;

	public class Videos {
		
		private var requestHelper:RequestHelper;
		
		public function Videos(requestHelper:RequestHelper) {
			this.requestHelper = requestHelper;
		}
		
		/* ===== GET/SET ===== */
		
		public function getEmbedCode(resultListener:Function, errorListener:Function, videoId:String, 
									 embedCodeType:Number = NaN, playerType:String = null, wmode:String = null,
									 offset:Number = NaN, branding:Boolean = true, autoplay:Boolean = false, 
									 width:Number = NaN, height:Number = NaN):void {
			
			var parameters:Object = {video_id:videoId, branding:branding, autoplay:autoplay};
			
			if (!isNaN(embedCodeType)) {
				parameters.embed_code_type = embedCodeType;
			}
			
			if (!isNaN(offset)) {
				parameters.offset = offset;
			}
			
			if (!isNaN(width)) {
				parameters.width = width;
			}
			
			if (!isNaN(height)) {
				parameters.height = height;
			}
			
			if (wmode!=null) {
				parameters.wmode = wmode;
			}
			
			if (playerType!=null) {
				parameters.player_type = playerType;
			}
			
			requestHelper.get('viddler.videos.getEmbedCode', 
				new EmbedCodeResult, 
				parameters,  
				resultListener, errorListener);
			
		}
		
		public function getEmbedCodeTypes(resultListener:Function, errorListener:Function):void {			
			requestHelper.get('viddler.videos.getEmbedCodeTypes', 
				new EmbedCodeTypesResult,  
				{}, 
				resultListener, errorListener);
			
		}
		
		/* ===== HANDLERS ===== */
	}
}