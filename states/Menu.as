package states 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import core.GameData;
	
	public class Menu extends State
	{
		// Buttons
		private var bStart:GenericButton;
		private var bSettings:GenericButton;
		private var bAbout:GenericButton;
		// Images
		private var iTitle:TitleImage;
		//private var testsprite:Sprite = new Sprite();
		// Core
		private var statemachine:StateMachine;
		private var gamedata:GameData;
		
		public function Menu(statemachine:StateMachine,gamedata:GameData) :void
		{
			
			allowOverlay = true;
			this.gamedata = gamedata;
			this.statemachine = statemachine;
			iTitle = new TitleImage();
			bStart = new GenericButton();
			bStart.txtName.text = "Start";
			bSettings = new GenericButton();
			bSettings.txtName.text = "Settings";
			bAbout = new GenericButton();
			bAbout.txtName.text = "About";
			this.addChild(iTitle);
			InitButtons();
			this.addChild(bStart);
			this.addChild(bSettings);
			this.addChild(bAbout);
		}
		
		override public function Enter():void {
		}
		override public function Exit():void{
			RemoveListeners();
		}
		
		override public function AddListeners():void{
			bStart.addEventListener(MouseEvent.CLICK,BStart,false,0,true);
			bSettings.addEventListener(MouseEvent.CLICK,BSettings,false,0,true);
			bAbout.addEventListener(MouseEvent.CLICK,BAbout,false,0,true);
		}
		
		public function RemoveListeners():void{
			bStart.removeEventListener(MouseEvent.CLICK,BStart);
			bSettings.removeEventListener(MouseEvent.CLICK,BSettings);
			bAbout.removeEventListener(MouseEvent.CLICK,BAbout);
		}
			
		private function InitButtons():void{
			bStart.x = 6;
			bStart.y = 450;
			bSettings.x = 6;
			bSettings.y = 500;
			bAbout.x = 6;
			bAbout.y = 550;
		}
		
		private function BStart(e:MouseEvent):void{
			var gamestate:GameState = new GameState(statemachine,gamedata);
			statemachine.SetNextState(gamestate);
			statemachine.GotoNextState();
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
		}
		
		private function BSettings(e:MouseEvent):void{
			var settingstate:Settings = new Settings(statemachine,gamedata);
			statemachine.SetNextState(settingstate);
			statemachine.GotoNextState();
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
		}
		
		private function BAbout(e:MouseEvent):void{
			var aboutstate:About = new About(statemachine,gamedata);
			statemachine.SetNextState(aboutstate);
			statemachine.GotoNextState();
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
		}
		
		
	}

}