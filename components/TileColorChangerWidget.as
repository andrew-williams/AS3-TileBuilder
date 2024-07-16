package components {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import core.GameData;
	
	public class TileColorChangerWidget extends Sprite{

		private var bLeftColor:DecreaseButton;
		private var bRightColor:IncreaseButton;
		private var colorID:int = 0;
		private var colorArray:Array = new Array(0xFFFFFF,0xFF0000,0xFF7F00,0xFFFF00,0x00FF00,0x0000FF,0xBF00FF,0x964B00,0x808080,0x000000);
		private var widgetName:TextField;
		//Tile color change
		private var tile:Tile;		
		
		private var gamedata:GameData;
		
		public function TileColorChangerWidget(gamedata:GameData):void{
			this.gamedata = gamedata;
			widgetName = new TextField();
			widgetName.text = "Tile Color Settings";
			widgetName.x = 140;
			widgetName.textColor = 0xFFFFFF;
			widgetName.mouseEnabled = false;
			this.addChild(widgetName);
			InitColorChanger();
			bLeftColor.addEventListener(MouseEvent.CLICK, BLeftColor,false,0,true);
			bRightColor.addEventListener(MouseEvent.CLICK, BRightColor,false,0,true);
		}
		
		public function Delete():void{
			bLeftColor.removeEventListener(MouseEvent.CLICK, BLeftColor);
			bRightColor.removeEventListener(MouseEvent.CLICK, BRightColor);
			tile = null;
			gamedata = null;
			colorArray = null;
			bLeftColor = null;
			bRightColor = null;
		}
		
		private function BLeftColor(e:MouseEvent):void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
			DecrementColor();
		}
		
		private function BRightColor(e:MouseEvent):void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
			IncrementColor();
		}
		
		private function InitColorChanger():void{
			bLeftColor = new DecreaseButton();
			bLeftColor.x = 112;
			bLeftColor.y = 25;
			tile = new Tile(-1,-1,true);
			tile.ChangeTileData(2);
			tile.ChangeTileDisplay();
			tile.x = 172;
			tile.y = 25;
			bRightColor = new IncreaseButton();
			bRightColor.x = 230;
			bRightColor.y = 25;
			for (var i:int = 0; i < colorArray.length; i++){
				if (gamedata.tileColor == colorArray[i]){
					colorID = i;
					tile.ChangeColor(gamedata.tileColor);
				}
			}
			this.addChild(bLeftColor);
			this.addChild(tile);
			this.addChild(bRightColor);
		}

		public function IncrementColor():void{
			if (colorID < colorArray.length){
				colorID++;
				gamedata.tileColor = colorArray[colorID];
				tile.ChangeColor(gamedata.tileColor);
			}
		}
		
		public function DecrementColor():void{
			if (colorID > 0){
				colorID--;
				gamedata.tileColor = colorArray[colorID];
				tile.ChangeColor(gamedata.tileColor);
			}
		}
	}
	
}
