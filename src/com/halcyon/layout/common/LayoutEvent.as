package com.halcyon.layout.common
{
	import flash.events.Event;

	public class LayoutEvent extends Event
	{
		public var extra:Object;
		
		public function LayoutEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, extra:Object = null) 
		{
			super(type, bubbles, cancelable);
			this.extra = extra;
		}
	}
}