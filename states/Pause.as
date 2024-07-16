package states {
	
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import gui.PauseWindow;
	import gui.HelpWindow;
	import core.GameData;

	public class Pause extends State{

		private var statemachine:StateMachine;
		private var gamedata:GameData;
		
		private var window:GenericWindow;
		private var backMask:Sprite;
	
		public function Pause(statemachine:StateMachine,gamedata:GameData):void {
			
			this.gamedata = gamedata;
			this.statemachine = statemachine;
			this.alpha = 1;
			
		}
		
		override public function Enter():void{
			backMask = new Sprite();
			backMask.alpha = 0.2;
			backMask.graphics.beginFill(0x000000);
			backMask.graphics.drawRect(0,0,gamedata.levelWidth,gamedata.levelHeight);
			this.addChild(backMask);
			LoadPauseWindow();
		}
		
		private function LoadPauseWindow():void{
			window = new PauseWindow(statemachine,gamedata,"Paused",(gamedata.levelWidth / 2),(gamedata.levelHeight / 2));
			this.addChild(window);
			window.AddListeners();
			window.addEventListener("loadHelp",LoadHelpWindow,false,0,true);
		}
		private function LoadHelpWindow(e:Event):void{
			window.removeEventListener("LoadHelp",LoadHelpWindow);
			this.removeChild(window);
			window = null;
			window = new HelpWindow(statemachine,gamedata,"Help",(gamedata.levelWidth / 2),(gamedata.levelHeight / 2));
			this.addChild(window);
			window.AddListeners();
		}
		
		override public function Exit():void{
			this.removeChild(backMask);
			this.removeChild(window);
			window = null;
		}
		
		override public function KeyDown(e:KeyboardEvent):void{
			switch (e.keyCode){
				case Keyboard.LEFT:
					window.colorwidget.DecrementColor()
					gamedata.soundmanager.StopSFXChannel();
					gamedata.soundmanager.PlaySFX(new sndClick());
					break;
				case Keyboard.RIGHT:
					window.colorwidget.IncrementColor()
					gamedata.soundmanager.StopSFXChannel();
					gamedata.soundmanager.PlaySFX(new sndClick());
					break;
			}
		}
	}
	
}
