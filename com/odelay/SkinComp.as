package com.odelay {
	import flash.events.MouseEvent;
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.components.TextArea;
	
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
	
	public class SkinComp extends SkinnableComponent {
		
		private var _text:String = "";
		
		[SkinPart(required="true")]
		public var buttonOne:Button = null;
		
		[SkinPart(required="false")]
		public var buttonTwo:Button = null;
		
		[SkinPart(required="false")]
		public var buttonThree:Button = null;
		
		[SkinPart(required="true")]
		public var closeButton:Button = null;
		
		[SkinPart(required="true")]
		public var txt:TextArea = null;
		
		public function SkinComp() {
			super();
		}
		
		override protected function partAdded(partName:String, instance:Object):void{
			super.partAdded(partName, instance);
			
			switch (instance) {
				case this.buttonOne:
					instance.addEventListener(MouseEvent.CLICK, btnClickHand, false, 0, true);
				break;
				case this.buttonTwo:
					instance.addEventListener(MouseEvent.CLICK, btnClickHand, false, 0, true);
				break;
				case this.buttonThree:
					instance.addEventListener(MouseEvent.CLICK, btnClickHand, false, 0, true);
				break;
				case this.txt:
					//this.txtNum.addEventListener(Event.CHANGE,         this._onChangeNum,    false, 0, true);
				break;
			}
		}
		
		private function btnClickHand(e:MouseEvent):void {
			trace("tast");
		}
		
		public function set text(value:String):void {
			_text = value;
		}
		
	}

}