package com.odelay {
	import flash.events.*;
	import spark.components.*;
	import spark.events.TrackBaseEvent;
	/**
	 * @author Thomas @ThomasOdelay www.agence-odelay.com
	 * @version 0.1
	 * ----------------------------------------------------------------------------
	 * "THE BEER-WARE LICENSE" (Revision 42):
	 * <thomas@agence-odelay.com> wrote this file. As long as you retain this notice you
	 * can do whatever you want with this stuff. If we meet some day, and you think
	 * this stuff is worth it, you can buy me a beer in return Thomas Malicet
	 * ----------------------------------------------------------------------------
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