package states
{
	
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	
	public class State extends Sprite{

		protected var allowOverlay:Boolean = false;
		
		public function State():void{
			Init();
		}
		
		public function AllowOverlay():Boolean{
			return allowOverlay;
		}
	
		// Initialization That Will Run Once Unless New One Is Created
		protected function Init():void{
			trace(this+": Init called.");
		}
		// Initialization Function When Screen Is Entered
		public function Enter():void{
			trace(this+": Enter called.");
		}
		// Function to call when exiting a scene
		public function Exit():void{
			trace(this+": Exit called.");
		}
		
		public function Delete():void{
			trace(this+": Unloading State...");
		}
		
		// For transition
		public function AddListeners():void { }
		
		// Listeners
		public function KeyDown(e:KeyboardEvent):void {}
		public function Update():void{}
		public function MouseDown():void{}
		public function MouseMove(): void{}
		public function Tick(): void{}
		

	}
	
}
