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
	public class Utils{
		
		public function Utils() {
			

		}
		public static function padTime(tim:Number):String{
			return (tim<10) ? String("0"+tim) : String(tim);
		}
		
		public static function print_a(obj:*, indent:String = null):String{
			if (indent == null) indent = "";
			var out:String = "";
			for (var item:String in obj) {
				if (typeof(obj[item]) == "object" ){
					out += indent+"[" + item + "] => Object\n";
				}else{
					out += indent+"[" + item + "] => " + obj[item]+"\n";
				}
				out += print_a(obj[item], indent+"   ");
			}
			return out;
		}
		
		public static function calculDisplayTime(sec:Number):String {
			// x les minutes, y les secondes, z les heures
			var x:Number = Math.floor(sec / 60);
			var y:Number = sec - x * 60 ;
			var str:String =  (y > 9) ? y.toString() : "0" + y;
			var z:Number;
			
			if (x >= 60) {
				z = Math.floor(x / 60);
				x = x - 60 * z;
				var str2:String =  (x > 9) ? x.toString() : "0" + x;
				
				return z.toString() + "h" + str2 + "m" + str +"s";
			}else {
				return x.toString() + "m" + str +"s";
			}
		}
	}
}