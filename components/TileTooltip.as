package components {
	
	import flash.display.MovieClip;
	
	
	public class TileTooltip extends MovieClip {

		private var tile:Tile;
		
		public function TileTooltip() {
			tile = new Tile(-1,-1);
			this.addChild(tile);
			txtDescription.wordWrap = true;
		}
		
		public function ShowTooltip():void{
			this.visible = true;
		}
		
		public function HideTooltip():void{
			this.visible = false;
		}
		
		public function UpdateTooltip(tileID:int,description:String):void{
			tile.ChangeTileData(tileID);
			tile.ChangeTileDisplay();
			txtDescription.text = description;
		}
	}
	
}
