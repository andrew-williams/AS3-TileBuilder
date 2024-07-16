package gui {
	import states.State;
	
	public class FadeTransition {

		private var currentState:State;
		private var transitionActive:Boolean;
		private var transitionDirection:Boolean; //false = out, true = in
		private var transitionComplete:Boolean;
		
		public function FadeTransition():void {
			transitionActive = false;
			transitionComplete = false;
		}
		
		public function SetState(state:State):void{
			currentState = state;
		}
		
		public function Fade(oldValue:Number):Number{
			var newValue:Number = oldValue;
			if (transitionDirection){
				newValue += 0.05;
			}
			else{
				newValue -= 0.05;
			}			
			if ((newValue > 1) || (newValue < 0)){
				transitionActive = false;
				transitionComplete = true;
			}
			return newValue;
		}
		
		public function StartTransition(fadeIn:Boolean):void{
			transitionDirection = fadeIn;
			transitionActive = true;
		}
		
		public function GetTransitionActive():Boolean{
			return transitionActive;
		}
		public function GetTransitionComplete():Boolean{
			return transitionComplete;
		}
		public function GetDirection():Boolean{
			return transitionDirection;
		}

	}
	
}
