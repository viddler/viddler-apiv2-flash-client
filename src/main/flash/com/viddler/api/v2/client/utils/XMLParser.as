package com.viddler.api.v2.client.utils {
	import com.viddler.api.v2.client.model.Playlist;
	import com.viddler.api.v2.client.model.Video;
	import com.viddler.api.v2.client.model.VideoList;
	
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	
	public class XMLParser {
		
		private static var parsers:Dictionary;

		public static function parse(xml:XML, object:Object):void {
			initParsers();
			var fields:XMLList = describeType(object)..variable;	
			for (var i:Number = 0; i < fields.length(); i++) {
				var name:String = fields[i].@name;
				var type:String = fields[i].@type;
				var parser:Function = parsers[type];
				if (parser != null) {
					object[name] = parser(xml.child(getTagName(name)));
				} else {
					throw new Error('unknown type: ' + type);
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
			var videoList:VideoList = new VideoList();
			var children:XMLList = xml.video;
			videoList.videos = [];
			for each (var child:XML in children) {
				var video:Video = new Video();
				XMLParser.parse(child, video);
				videoList.videos.push(video);
			}
			return videoList;
		}
		
		private static function parsePlaylist(xml:XMLList):Playlist {
			var playlist:Playlist = new Playlist();
			XMLParser.parse(xml[0], playlist);
			return playlist;
		}
		
		private static function getTagName(name:String):String {
			var tagName:String = name.replace(/([A-Z])/, '_$1');
			return tagName.toLowerCase();
		}
		
	}
}