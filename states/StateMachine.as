package states
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import gui.FadeTransition;

	public class StateMachine {
	
		private var stageParent:Sprite;
		private var previousState:State;
		private var currentState:State;
		private var nextState:State;
		
		private var tHandler:FadeTransition;
		
		public function StateMachine(stageParent:Sprite):void {
			this.stageParent = stageParent;
			tHandler = new FadeTransition();
		}
		
		private function Init():void {
			previousState = null;
			currentState = null;
			nextState = null;
		}
		
		public function GetTransition():FadeTransition{
			return tHandler;
		}
		
		public function SetNextState(newState:State):void{
			nextState = newState;
		}
		
		public function GotoPreviousState():void{
			UnloadState(currentState);
			DeleteState(currentState);
			currentState = previousState;
			previousState = null;
			LoadState(currentState);
			currentState.Enter();
		}
		
		public function GotoNextState():void {
			UnloadState(currentState);
			if (previousState != null){
				DeleteState(previousState);
			}
			previousState = currentState;
			currentState = nextState;
			nextState = null;
			
			LoadState(currentState);
			currentState.Enter();
		}
		
		public function GetCurrentState():State {
			
			return currentState;
		}
		
		public function UnloadState(unloadedState:State):void{
			if (unloadedState != null){
				unloadedState.Exit();
				if (!unloadedState.AllowOverlay()) {
					stageParent.removeChild(unloadedState);
				}
			}
		}
		private function LoadState(newState:State):void {
			tHandler.SetState(newState);
			tHandler.StartTransition(true);
			newState.AddListeners();
			stageParent.addChild(newState);
		}
		
		private function DeleteState(oldState:State):void{
			if (oldState.AllowOverlay()){
				stageParent.removeChild(oldState);
			}
			oldState.Delete();
		}
		
		
		public function Update():void{
			
			if (tHandler.GetTransitionActive()){
				currentState.alpha = tHandler.Fade(currentState.alpha);
				if (currentState.alpha >= 1){currentState.AddListeners();}
				//else if (currentState.alpha <= 0){currentState.RemoveListeners();}
			}
			currentState.Update();
		}
	}
	
}
