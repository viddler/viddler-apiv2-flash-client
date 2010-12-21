package com.viddler.api.v2.client.utils {
	import com.viddler.api.v2.client.model.Playlist;
	import com.viddler.api.v2.client.model.PlaylistResult;
	import com.viddler.api.v2.client.model.VideoList;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	
	public class XMLParserTest {		
		
		[Before]
		public function setUp():void {
			
		}
		
		[After]
		public function tearDown():void {
			
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void {
			
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void {
			
		}
		
		[Test]
		public function testPlaylistResult():void {
			var xml:XML =
				<list_result>
					<page>1</page>
					<per_page>10</per_page>
					<playlist>
						<id>718a076f7414e6e9</id>
						<name>test</name>
						<type>regular</type>
						<visibility>public</visibility>
						<user>garar</user>
					</playlist>
					<video_list>
						<video>
							<id>99febe3d</id>
						</video>
						<video>
							<id>da14c5a9</id>
						</video>
						<video>
							<id>e8ba0028</id>
						</video>
						<video>
							<id>261acc8c</id>
						</video>
					</video_list>
				</list_result>;
			var result:PlaylistResult = new PlaylistResult();
			XMLParser.parse(xml, result);
			var playlist:Playlist = result.playlist;
			assertNotNull(playlist);
			assertEquals('718a076f7414e6e9', playlist.id);
			assertEquals('test', playlist.name);
			assertEquals('regular', playlist.type);
			assertEquals('public', playlist.visibility);
			assertEquals('garar', playlist.user);
			var videoList:VideoList = result.videoList;
			assertNotNull(videoList);
			var videos:Array = videoList.videos;
			assertNotNull(videos);
			assertEquals(4, videos.length);
			assertEquals('99febe3d', videos[0].id);
			assertEquals('da14c5a9', videos[1].id);
			assertEquals('e8ba0028', videos[2].id);
			assertEquals('261acc8c', videos[3].id);
		}
		
		
	}
}