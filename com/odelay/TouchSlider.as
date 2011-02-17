package com.odelay {
	import flash.events.*;
	import spark.components.*;
	import spark.events.TrackBaseEvent;
	/**
	 * ...
	 * @author Tmhk
	 */
	public class TouchSlider extends HSlider {
		
		public function TouchSlider() {
			addEventListener(TrackBaseEvent.THUMB_RELEASE, returnToZero);
		}
		override protected function track_mouseDownHandler(event:MouseEvent):void { }
		
		public function returnToZero(e:Event):void {
			value = 0;
		}
	}

}