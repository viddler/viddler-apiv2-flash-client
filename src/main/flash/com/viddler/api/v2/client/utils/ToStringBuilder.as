package com.viddler.api.v2.client.utils {
	import flash.utils.getQualifiedClassName;
	
	public class ToStringBuilder {
		
		private var object:Object;
		
		private var properties:Array = [];
		
		public function ToStringBuilder(object:Object) {			
			this.object = object;
		}
		
		public function toString():String {
			var msg:String = '[' + getQualifiedClassName(object);
			
			for each (var property:Object in properties) {
				msg += ' ' + property.name + '=' + property.value;
			}
			
			msg += ']';
			return msg;
		}
		
		public function addProperty(name:String, value:*):ToStringBuilder {
			properties.push({ name: name, value: value});
			return this;
		}
		
	}
}