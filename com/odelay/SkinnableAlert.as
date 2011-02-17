package com.odelay {
	import com.odelay.skins.AlertSkin;
	import com.odelay.supportclasses.AlertEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.core.FlexGlobals;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.components.TextArea;
	
	/**
	 * Usage : SkinnableAlert.show(
	 * display text : String
	 * type : int (0 = One OK button, 1 = Yes/No, 2 = Yes/No/Cancel, 3 = custom/custom/custom) Depending of the type you choose, you will have to define the corresponding number of skin parts. With type 3, you will have to define the 'labels' property to avoid empty buttons.
	 * parent : Sprite
	 * closeHandler : Function (receives an AlertEvent with a result property corresponding of the button clicked : 1-first button, 2-second, 3-third, 4-close button)
	 *
	 * @author ThomasOdelay www.agence-odelay.com
	 */
	
	public class SkinnableAlert extends SkinnableComponent {
		
		private var _text:String = "";
		
		public static var labels:Array = ["Ok","",""];
		
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
		
		public function SkinnableAlert() {
			super();
			setStyle("skinClass", AlertSkin);
		}
		
		override protected function partAdded(partName:String, instance:Object):void{
			super.partAdded(partName, instance);
			
			switch (instance) {
				case this.buttonOne:
					instance.label = labels[0];
					instance.addEventListener(MouseEvent.CLICK, yesHand, false, 0, true);
				break;
				case this.buttonTwo:
					instance.label = labels[1];
					instance.addEventListener(MouseEvent.CLICK, noHand, false, 0, true);
				break;
				case this.buttonThree:
					instance.label = labels[2];
					instance.addEventListener(MouseEvent.CLICK, cancelHand, false, 0, true);
				break;
				case this.closeButton:
					instance.addEventListener(MouseEvent.CLICK, closeHand, false, 0, true);
				break;
				case this.txt:
					instance.text = _text;
				break;
			}
		}
		
		private function yesHand(e:MouseEvent):void {
			dispatchEvent(new AlertEvent("result", 1));
			close();
		}
		private function noHand(e:MouseEvent):void {
			dispatchEvent(new AlertEvent("result", 2));
			close();
		}
		private function cancelHand(e:MouseEvent):void {
			dispatchEvent(new AlertEvent("result", 3));
			close();
		}
		
		private function closeHand(e:Event):void {
			dispatchEvent(new AlertEvent("result", 4));
			close();
		}
		
		private function close():void {
			PopUpManager.removePopUp(this);
		}
		private function btnClickHand(e:MouseEvent):void {
			trace("tast");
		}
		
		public function set text(value:String):void {
			_text = value;
		}
		
		public static function show(text:String = "", type:int = 0, parent:Sprite = null, closeHandler:Function = null, skin:Class = null):void {
			
			var alert:SkinnableAlert = new SkinnableAlert();
			alert.x = parent.stage.stageWidth / 2 - alert.width / 2;
			alert.y = parent.stage.stageHeight / 2 - alert.height / 2;
			
			alert._text = text;

			switch (type) {
				case 0 :
				break;
				case 1 :
					labels = ["Yes", "No"];
				break;
				case 2 :
					labels = ["Yes", "No", "Cancel"];
				break;
				case 3 :
					
				break;
				default:
			}
			
			if (!parent) parent = Sprite(FlexGlobals.topLevelApplication);
			
			if (skin != null) alert.setStyle("skinClass", skin);
			
			if (closeHandler != null) alert.addEventListener(AlertEvent.RESULT, closeHandler);
			
			PopUpManager.addPopUp(alert, parent);
			
			alert.addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
		}
		private static function completeHandler(event:FlexEvent):void {
			PopUpManager.centerPopUp(SkinnableAlert(event.target));
		}
	}
}