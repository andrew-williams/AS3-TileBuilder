package states {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import gui.SettingsWindow;
	import core.GameData;
	
	public class Settings extends State{

		private var statemachine:StateMachine;
		private var gamedata:GameData;
		
		private var window:GenericWindow;
		private var backMask:Sprite;
	
		public function Settings(statemachine:StateMachine,gamedata:GameData):void {
			this.gamedata = gamedata;
			this.statemachine = statemachine;
			this.alpha = 0;
		}
		
		override public function Enter():void{
			backMask = new Sprite();
			backMask.alpha = 0.2;
			backMask.graphics.beginFill(0x000000);
			backMask.graphics.drawRect(0,0,gamedata.levelWidth,gamedata.levelHeight);
			this.addChild(backMask);
			
			window = new SettingsWindow(statemachine,gamedata,"Settings",(gamedata.levelWidth / 2),(gamedata.levelHeight / 2));
			this.addChild(window);
			window.AddListeners();
		}
		
		override public function Exit():void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
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
