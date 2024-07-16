package gui {
	
	import flash.events.MouseEvent;
	import flash.events.Event;
	import states.StateMachine;
	import flash.text.TextField;
	import core.GameData;
	
	public class HelpWindow extends GenericWindow{
		
		private var statemachine:StateMachine;
		private var gamedata:GameData;
		private var helpText:TextField;
		
		public function HelpWindow(statemachine:StateMachine,gamedata:GameData,windowName:String, xPos:int, yPos:int):void {
			this.statemachine = statemachine;
			this.gamedata = gamedata;
			txtName.text = windowName;
			bBack.txtName.text = "Back";
			this.x = xPos - width/2;
			this.y = yPos - height/2;
			helpText = new TextField();
			var helpfield:String = "";
			helpfield += "                            Controls:\n";
			helpfield += "Click on a square to place a block.\n";
			helpfield += "Click on an occupied square to clear block.\n";
			helpfield += "Left and Right arrow keys change tile color in menu.\n";
			helpText.text = helpfield;
			helpText.textColor = 0xFFFFFF;
			helpText.width = 300;
			helpText.x = 80;
			helpText.y = 50;
			this.addChild(helpText);
		}
		
		public function AddListeners():void{
			bBack.addEventListener(MouseEvent.CLICK, BBack,false,0,true);
		}
		
		private function BBack(e:MouseEvent):void{
			bBack.removeEventListener(MouseEvent.CLICK,BBack);
			statemachine.GotoPreviousState();
			
		}

	}
	
}
