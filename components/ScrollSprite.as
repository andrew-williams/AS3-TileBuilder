package components {
	
	import flash.events.Event;
	import flash.display.Sprite;
	
	public class ScrollSprite{

		private var spriteArray:Array;
		private var speed:Number = 2;
		private var stageheight:Number;
		private var stagewidth:Number;
		
		public function ScrollSprite(sWidth:Number,sHeight:Number):void{
			stagewidth = sWidth;
			stageheight = sHeight;
			spriteArray = new Array();
		}
		
		public function AddSprite(sprite:Sprite, startX:int,startY:int):void{
			sprite.x = startX;
			sprite.y = startY;
			spriteArray.push(sprite);
		}
		
		public function Update():void{
			for (var i:int = 0; i < spriteArray.length; i++){
				spriteArray[i].x += speed;
				if (spriteArray[i].x > stagewidth){
					spriteArray[i].x = spriteArray[i].width * -1;
					spriteArray[i].y = Math.floor(Math.random() * (stageheight - spriteArray[i].y));
				}
			}
		}

	}
	
}
