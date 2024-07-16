package gui {
	
	import flash.events.MouseEvent;
	import flash.events.Event;
	import states.StateMachine;
	import flash.text.TextField;
	import core.GameData;
	
	public class AboutWindow extends GenericWindow{
		
		private var statemachine:StateMachine;
		private var gamedata:GameData;
		private var aboutText:TextField;
		
		public function AboutWindow(statemachine:StateMachine,gamedata:GameData,windowName:String, xPos:int, yPos:int):void {
			this.statemachine = statemachine;
			this.gamedata = gamedata;
			txtName.text = windowName;
			bBack.txtName.text = "Back";
			this.x = xPos - width/2;
			this.y = yPos - height/2;
			aboutText = new TextField();
			var aboutfield:String = "";
			aboutfield += "Author: Andrew Williams\nDescription: Tile Building\nConnecting adjacent tiles.\n";
			aboutfield += "Created on Monday, June 23, 2014\nWebsite: http://andrew-williams-page.com\n";
			aboutfield += "Email: andrew.williams.ca@gmail.com\nAll art assets are made by me except clouds\n";
			aboutfield += "Clouds from: https://az31353.vo.msecnd.net/pub/urpxtcgq\n\n";
			aboutfield += "Sounds from: https://www.freesound.org/people/schademans/sounds/13280/\n";
			aboutfield += "https://www.freesound.org/people/ecfike/sounds/128919/";
			aboutText.text = aboutfield;
			aboutText.textColor = 0xFFFFFF;
			aboutText.width = 300;
			aboutText.x = 100;
			aboutText.y = 50;
			this.addChild(aboutText);
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
