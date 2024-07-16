package gui {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import media.SoundManager;
	
	public class HUD extends MovieClip {
		
		private var locked:Boolean = false;
		private var opening:Boolean = false;
		private var closing:Boolean = false;
		private var soundmanager:SoundManager;
		
		public function HUD(sndManager:SoundManager):void{
			soundmanager = sndManager;
			this.y = -400;
			btnPause.txtName.text = "Pause";
			
		}
		
		public function AddListeners():void{
			btnPause.addEventListener(MouseEvent.CLICK,BPause,false,0,true);
			btnOpen.addEventListener(MouseEvent.CLICK,BOpen,false,0,true);
			btnClose.addEventListener(MouseEvent.CLICK,BClose,false,0,true);
		}
		
		public function RemoveListeners():void{
			btnPause.removeEventListener(MouseEvent.CLICK,BPause);
			btnOpen.removeEventListener(MouseEvent.CLICK,BOpen);
			btnClose.removeEventListener(MouseEvent.CLICK,BClose);
		}
		
		public function PushStatistics(activeTiles:int,totalClicks:int,mPosX:Number,mPosY:Number,seconds:int):void{
			txtActiveTiles.text = activeTiles.toString();
			txtTotalClicks.text = totalClicks.toString();
			txtMouseX.text = mPosX.toString();
			txtMouseY.text = mPosY.toString();
			txtSeconds.text = seconds.toString();
		}
		
		private function BPause(e:MouseEvent):void{
			dispatchEvent(new Event("Pause"));		
			soundmanager.StopSFXChannel();
			soundmanager.PlaySFX(new sndClick());
		}		
		
		private function BOpen(e:MouseEvent):void{
			if (!locked){
				locked = true;
				opening = true;
				soundmanager.StopSFXChannel();
				soundmanager.PlaySFX(new sndClick());
			}
		}
		private function BClose(e:MouseEvent):void{
			if (!locked){
				locked = true;
				closing = true;
				soundmanager.StopSFXChannel();
				soundmanager.PlaySFX(new sndClick());
			}
		}
		
		public function Update():void{
			if (opening){
				if (this.y < 0){this.y+= 24;}else{
					opening = false;
					this.y = 0;
					locked = false;
				}
			}
			if (closing){
				if (this.y > -400){this.y-= 24;}
				else{
					closing = false;
					this.y = -400;
					locked = false;
				}
			}
		
			
		}
	}
	
}
