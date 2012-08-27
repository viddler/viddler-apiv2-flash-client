package com.viddler.api.v2.client.utils {
	import com.viddler.api.v2.client.model.EmbedCodeType;
	import com.viddler.api.v2.client.model.EmbedCodeTypesResult;
	import com.viddler.api.v2.client.model.Playlist;
	import com.viddler.api.v2.client.model.Video;
	import com.viddler.api.v2.client.model.VideoList;
	
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	
	public class XMLParser {
		
//		private static const logger:Logger = Logger.forClass(XMLParser);
		
		private static var parsers:Dictionary;

		public static function parse(xml:XML, object:Object):void {
			initParsers();
			var description:XML = describeType(object); 
			var fields:XMLList = description..variable;			
			var className:String = description.@name;			
			var parser:Function = parsers[className];
			var i:int;
			
//			logger.warning('className: {}, parser: {}', [className, parser]);
			
			if (parser != null) {
				var res:Object = parser(XMLList(xml));
				for (i = 0; i < fields.length(); i++) {
					var fname:String = fields[i].@name; 
					object[fname] = res[fname]; 
				}
			} else {
				for (i = 0; i < fields.length(); i++) {
					var name:String = fields[i].@name;
					var type:String = fields[i].@type;
					parser = parsers[type];
					if (parser != null) {
						object[name] = parser(xml.child(getTagName(name)));
					} else {
						throw new Error('unknown type: ' + type);
					}
				}
			}			
		}
		
		private static function initParsers():void {
			if (parsers == null) {
				parsers = new Dictionary();
				addParser(String, parseString);
				addParser(Boolean, parseBoolean);
				addParser(Number, parseNumber);
				addParser(VideoList, parseVideoList);
				addParser(Playlist, parsePlaylist);
				addParser(EmbedCodeTypesResult, parseEmbedCodeTypesResult);
			}
		}
		
		private static function addParser(clazz:Class, parser:Function):void {
			parsers[getQualifiedClassName(clazz)] = parser;
		}
		
		
		
		private static function parseString(xml:XMLList):String {
			return xml.text();
		}
		
		private static function parseBoolean(xml:XMLList):Boolean {
			return xml.text() == 'true';
		}
		
		private static function parseNumber(xml:XMLList):Number {
			return Number(xml.text());
		}
		
		private static function parseVideoList(xml:XMLList):VideoList {
//			logger.warning('parseVideoList, xml: {}', [xml]);
			var videoList:VideoList = new VideoList();
			var children:XMLList = xml.video;
			videoList.videos = [];
			for each (var child:XML in children) {
//				logger.warning('child: {}', [child.thumbnail_url]);
				var video:Video = new Video();
				video.id = child.id;
				video.thumbnailUrl = child.thumbnail_url;
				video.title = child.title;
				videoList.videos.push(video);
			}
			return videoList;
		}
		
		private static function parseEmbedCodeTypesResult(xml:XMLList):EmbedCodeTypesResult {
			var res:EmbedCodeTypesResult = new EmbedCodeTypesResult;			
			var children:XMLList = xml.embed_code_types.embed_code_type;
			for each (var child:XML in children) {
				var embedCodeType:EmbedCodeType = new EmbedCodeType;
				XMLParser.parse(child,embedCodeType);
				res.embedCodeTypes.push(embedCodeType);
			}
			res.defaultType = xml.default;
			return res;
		}
		
		private static function parsePlaylist(xml:XMLList):Playlist {
//			logger.warning('parsePlaylist, xml: {}', [getClassName(xml[0])]);
			var playlist:Playlist = new Playlist();
//			<playlist>
//				<id>718a076f7414e6e9</id>
//				<name>test</name>
//				<type>regular</type>
//				<visibility>public</visibility>
//				<user>garar</user>
//			  </playlist>
//			XMLParser.parse(xml[0], playlist);
			playlist.id = xml.@id;
			playlist.name = xml.@name;
			playlist.type = xml.@type;
			playlist.visibility = xml.@visibility;
			playlist.user = xml.@user;
//			XMLParser.parse(xml[0], playlist);
			return playlist;
		}	
		
		private static function getTagName(name:String):String {
			var tagName:String = name.replace(/([A-Z])/g, '_$1');
			return tagName.toLowerCase();
		}
		
		private static function getClassName(value:*):String {
			return getQualifiedClassName(value).split('::').pop();
		}
		
	}
}