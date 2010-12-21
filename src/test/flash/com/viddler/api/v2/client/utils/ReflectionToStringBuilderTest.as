package com.viddler.api.v2.client.utils {
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.asserts.fail;

	public class ReflectionToStringBuilderTest {
		
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
		public function testEmptyObject():void {
			assertEquals('[Object]', ReflectionToStringBuilder.toString({}));
		}
		
		[Test]
		public function testRealClass():void {
			var toString:String = ReflectionToStringBuilder.toString(new TestClass());
			// '[ReflectionToStringBuilderTest.as$0::TestClass foo=bar cyanide=happiness]'
			assertEquals(0, toString.indexOf('[ReflectionToStringBuilderTest.as$'));
			assertTrue(toString.indexOf('foo=bar') > 0);
			assertTrue(toString.indexOf('cyanide=happiness') > 0);
		}
	}
}

class TestClass {
	
	public var foo:String = 'bar';
	
	private var _cyanide:String = 'happiness';
	
	public function get cyanide():String {
		return _cyanide;
	}
	
}