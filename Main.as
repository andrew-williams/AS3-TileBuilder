package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import states.*;
	import core.GameData;
	
	public class Main extends Sprite {
		
		private var stateMachine:StateMachine;
		private var gamedata:GameData;
		private var tick:Timer;
		
		public function Main():void {
			gamedata = new GameData();
			stateMachine = new StateMachine(this);
			var menuState:Menu = new Menu(stateMachine,gamedata);
			stateMachine.SetNextState(menuState);
			stateMachine.GotoNextState();
			gamedata.levelWidth = stage.width;
			gamedata.levelHeight = stage.height;
			AddListeners();
		}
		
		private function AddListeners():void{
			this.addEventListener(Event.ENTER_FRAME, Update,false,0,true);
			this.addEventListener(MouseEvent.MOUSE_MOVE, MouseMove,false,0,true);
			this.addEventListener(MouseEvent.CLICK, MouseDown,false,0,true);
			this.addEventListener(KeyboardEvent.KEY_DOWN,KeyDown,false,0,true);
			tick = new Timer(1000,0);
			tick.addEventListener(TimerEvent.TIMER,tickTimer,false,0,true);
			tick.start();
		}
		
		private function Update(e:Event):void{
			stateMachine.Update();
		}
		
		private function MouseMove(e:MouseEvent):void{
			stateMachine.GetCurrentState().MouseMove();
			gamedata.mXPos = e.stageX;
			gamedata.mYPos = e.stageY;
		}
		
		private function MouseDown(e:MouseEvent):void{
			gamedata.totalClicks++;
			stateMachine.GetCurrentState().MouseDown();
		}
		private function tickTimer(e:TimerEvent):void{
			stateMachine.GetCurrentState().Tick();
		}
		private function KeyDown(e:KeyboardEvent):void{
			stateMachine.GetCurrentState().KeyDown(e);
		}
		
		
	}
	
}