package com.odelay {
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
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.events.DragEvent;
	import spark.effects.Move;
		
	public class DragButton extends DataButton {
		
		public var anim:Move;
		private var count:int = 0;
		private var over:Boolean = true;
		public var countDown:Number = 60;
		public var dragged:Boolean = false;
		
		public var previousCoord:Object;
		
		public function DragButton() {
			addEventListener(MouseEvent.MOUSE_DOWN, startCount);
			addEventListener(MouseEvent.MOUSE_UP, release);
			addEventListener(MouseEvent.MOUSE_OUT, cancel);
			
			anim = new Move();
			anim.target = this;
			anim.xTo = 5;
			anim.repeatCount = 6;
            anim.repeatBehavior = "reverse";
            anim.duration = 50;
		}
		
		// If the mouse leave the button without releasing
		private function cancel(e:MouseEvent):void {
			removeEventListener(Event.ENTER_FRAME, incrementCount);
			count = 0;
			dragComplete();
		}
		
		private function release(e:MouseEvent):void {
			dragComplete();
		}
		// When the button has been dragged and dropped
		private function dragComplete():void{
			if (dragged && !over) {
				stopDrag();
				dispatchEvent(new DragEvent("dragComplete"));
				over = true;
			}
		}
		// Counts how many time the press is hold
		private function startCount(e:MouseEvent):void {
			previousCoord = { x: this.x, y: this.y };
			addEventListener(Event.ENTER_FRAME, incrementCount);
			dragged = false;
		}
		// if the time is over, it starts to drag, if not, it keep counting
		private function incrementCount(e:Event):void {
			if (count == countDown) {
				removeEventListener(Event.ENTER_FRAME, incrementCount);
				count = 0;
				anim.play();
				trace(anim);
				startDrag();
				over = false;
				dragged = true;
				
			}else {
				count++;
			}
		}
		
	}
}
/*Move id="moveEffect" target="{targetBox}" xBy="100" repeatCount="2"
            repeatBehavior="reverse" effectStart="playButton.enabled=false"
            effectEnd="playButton.enabled=true;"/>*/