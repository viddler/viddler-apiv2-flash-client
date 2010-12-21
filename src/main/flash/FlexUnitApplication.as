package {
	
	import Array;
	
	import com.viddler.api.v2.client.utils.ReflectionToStringBuilderTest;
	import com.viddler.api.v2.client.utils.XMLParserTest;
	
	import flash.display.Sprite;
	
	import flexunit.flexui.FlexUnitTestRunnerUIAS;
	
	
	public class FlexUnitApplication extends Sprite {
		public function FlexUnitApplication()
		{
			onCreationComplete();
		}
		
		private function onCreationComplete():void
		{
			var testRunner:FlexUnitTestRunnerUIAS=new FlexUnitTestRunnerUIAS();
			this.addChild(testRunner); 
			testRunner.runWithFlexUnit4Runner(currentRunTestSuite(), "viddler-apiv2-flash-client");
		}
		
		public function currentRunTestSuite():Array
		{
			var testsToRun:Array = new Array();
			testsToRun.push(com.viddler.api.v2.client.utils.XMLParserTest);
			testsToRun.push(com.viddler.api.v2.client.utils.ReflectionToStringBuilderTest);
			return testsToRun;
		}
	}
}