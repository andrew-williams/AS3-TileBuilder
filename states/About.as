package states {
	
	import flash.display.Sprite;
	import flash.events.Event;
	import gui.AboutWindow;
	import core.GameData;

	public class About extends State{

		private var statemachine:StateMachine;
		private var gamedata:GameData;
		
		private var window:GenericWindow;
		private var backMask:Sprite;
	
		public function About(statemachine:StateMachine,gamedata:GameData):void {
			this.statemachine = statemachine;
			this.gamedata = gamedata;
			this.alpha = 0;
		}
		
		override public function Enter():void{
			backMask = new Sprite();
			backMask.alpha = 0.2;
			backMask.graphics.beginFill(0x000000);
			backMask.graphics.drawRect(0,0,gamedata.levelWidth,gamedata.levelHeight);
			this.addChild(backMask);
			
			window = new AboutWindow(statemachine,null,"About",(gamedata.levelWidth / 2),(gamedata.levelHeight / 2));
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

	}
	
}
