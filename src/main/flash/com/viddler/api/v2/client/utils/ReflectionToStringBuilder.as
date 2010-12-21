package com.viddler.api.v2.client.utils {
	import flash.utils.describeType;
	
	
	public class ReflectionToStringBuilder {
		public static function toString(object:Object):String {
			var builder:ToStringBuilder = new ToStringBuilder(object);
			var xml:XML = describeType(object);
			for each (var variable:XML in xml..variable) {
				var name:String = variable.attribute('name');
				builder.addProperty(name, object[name]);
			}
			for each (var accessor:XML in xml..accessor) {
				name = accessor.attribute('name');
				var access:String = accessor.attribute('access');
				if (access == 'readonly' || access == 'readwrite') {
					builder.addProperty(name, object[name]);
				}
			}
			return builder.toString();
		}
	}
}