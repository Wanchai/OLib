package com.odelay{
	import flash.data.*;
	import flash.errors.*;
	import flash.events.*;
	import flash.filesystem.*;
	/**
	 * @author Thomas @ThomasOdelay www.agence-odelay.com
	 * @version 0.1
	 * ----------------------------------------------------------------------------
	 * "THE BEER-WARE LICENSE" (Revision 42):
	 * <thomas@agence-odelay.com> wrote this file. As long as you retain this notice you
	 * can do whatever you want with this stuff. If we meet some day, and you think
	 * this stuff is worth it, you can buy me a beer in return Thomas Malicet
	 * ----------------------------------------------------------------------------
	 *
	 * Usage :
	 * public var db:SqlConnect;
	 * var db = new SqlConnect("FileName.db");
	 * db = new SqlConnect("OTime.db");
	 * db.addEventListener("ready", sendTables);
	 */
	public class SqlConnect extends SQLConnection {
		
        private var sqlStmt:SQLStatement = new SQLStatement();
        private var _reqArr:Array;
        private var _rezArr:Array;
		public var result:Array = null;
		
		public function SqlConnect(dbName:String) {
			addEventListener(SQLEvent.OPEN, openHandler);
			addEventListener(SQLErrorEvent.ERROR, errorHandler);
			
			openAsync(File.applicationStorageDirectory.resolvePath(dbName));
		}
		private function openHandler(e:SQLEvent):void {
			sqlStmt.sqlConnection = this;
			sqlStmt.addEventListener(SQLEvent.RESULT, reqResult);
			sqlStmt.addEventListener(SQLErrorEvent.ERROR, errorHandler);
			this.dispatchEvent(new Event("ready"));
		}
		public function set reqArr(value:Array):void {
			_reqArr = value;
			sqlStmt.text = _reqArr.shift();
			sqlStmt.execute();
		}
		public function get rezArr():Array { return _rezArr; }
		
		public function set rezArr(value:Array):void {
			_rezArr = value;
		}
		private function errorHandler(e:SQLErrorEvent):void {
			trace("Error message:", e.error.message);
			trace("Details:", e.error.details);
		}
		private function reqResult(e:SQLEvent):void {
			if (_reqArr.length > 0) {
				sqlStmt.text = _reqArr.shift();
				sqlStmt.execute();
			}
			var rez:SQLResult = sqlStmt.getResult();
			if (rez.data != null) {
				//trace("sqlStmt.getResult() : " + print_a(rez.data[1]));
				_rezArr = rez.data;
				this.dispatchEvent(new Event("requestResult"));
			}
/*			result.push();
    reqResult.dataProvider = result.data;*/
			//trace("Table created");
		}
		
/*		public function req(sqlReq:String, _type:String):*{
			stock[] = [sqlReq, type];
			//dispatchEvent("order", exec);
			//sqlStmt.text = sqlReq;
			//type = _type;
			createStmt.execute();

		}*/

	}
}