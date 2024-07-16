package components {
	import flash.display.Sprite;
	import flash.events.Event;
	import core.TileDefinitions;
	import core.TileDescriptions;
	
	public class Grid extends Sprite{

		private var lGame:Sprite;
		
		private var level:Array;
		private var levelWidth:Number;
		private var levelHeight:Number;
		private var gridWidth:Number;
		private var gridHeight:Number;
		private var tileWidth:int = 32;
		private var tileHeight:int = 32;
		private var tileDefinitions:TileDefinitions;
		private var tileDescriptions:TileDescriptions;
		
		public var hoverID:int;
		public var hoverDesc:String;
		public var hoverTile:Object;
		
		public var activeTiles:int;
		private var tileColor:uint = 0x000000;
		
		public function Grid(levelWidth:Number,levelHeight:Number,gridWidth:Number,gridHeight:Number,td:TileDefinitions,tdesc:TileDescriptions):void{
			tileDefinitions = td;
			tileDescriptions = tdesc;
			this.levelWidth = levelWidth;
			this.levelHeight = levelHeight;
			this.gridWidth = gridWidth;
			this.gridHeight = gridHeight;
			lGame = new Sprite();
			this.addChild(lGame);
			CreateLevel();
			
		}

		public function FillGrid():void{
			activeTiles = 0;
			for (var i:int = 0; i < gridWidth; i++){
				for (var j:int = 0; j < gridHeight; j++){
					level[i][j].SetValid();
					activeTiles++;
				}
			}
			UpdateGridData();
			UpdateGrid();
			UpdateHover();
		}
		
		public function ClearGrid():void{
			activeTiles = 0;
			for (var i:int = 0; i < gridWidth; i++){
				for (var j:int = 0; j < gridHeight; j++){
					level[i][j].ClearTile();
				}
			}
			UpdateGridData();
			UpdateGrid();
			UpdateHover();
		}
		
		public function ChangeTileColor(newcolor:uint):void{
			tileColor = newcolor;
		}
		
		private function TileChange(e:Event):void {
			dispatchEvent(new Event("playSound"));
			if (e.target.IsValid()){
				activeTiles++;
			}
			else{
				activeTiles--;
			}
			UpdateGridData();
			UpdateGrid();
			UpdateHover();
        }
		
		private function TileHover(e:Event):void{
			hoverTile = e.target;
			UpdateHover();
		}
		
		private function UpdateHover():void{
			hoverID = hoverTile.GetTileData();
			hoverDesc = hoverTile.GetTileDescription();
		}
		
		private function UpdateGridData():void{
			for (var i:int = 0; i < gridWidth ; i++){
				for (var j:int = 0; j < gridHeight;  j++){
					if (level[i][j].IsValid()){
						UpdateTileData(i,j);
					}
				}
			}
		}
		
		public function UpdateGrid():void{
			for (var i:int = 0; i < gridWidth; i++){
				for (var j:int = 0; j < gridHeight; j++){
					if (level[i][j].IsValid()){
						level[i][j].ChangeTile(tileDefinitions,tileDescriptions);
						level[i][j].ChangeColor(tileColor);
					}
				}
			}
		}
		
		private function UpdateTileData(xPos:int,yPos:int):void{
			var NW:Boolean = false;
			var N:Boolean = false;
			var NE:Boolean = false;
			var E:Boolean = false;
			var SE:Boolean = false;
			var S:Boolean = false;
			var SW:Boolean = false;
			var W:Boolean = false;
			var left:int = xPos - 1;
			var right:int = xPos + 1;
			var up:int = yPos - 1;
			var down:int = yPos + 1;
			if ((left >= 0) && (up >= 0) && (level[left][up].IsValid())) {NW = true;}
			if ((left >= 0) && (level[left][yPos].IsValid())){W = true;}
			if ((left >= 0) && (down < gridHeight) && (level[left][down].IsValid())){SW = true;}
			if ((up >= 0) && (level[xPos][up].IsValid())){N = true;}
			if ((down < gridHeight) && (level[xPos][down].IsValid())){S = true;}
			if ((right < gridWidth) && (up >= 0) && (level[right][up].IsValid())){NE = true;}
			if ((right < gridWidth) && (level[right][yPos].IsValid())){E = true;}
			if ((right < gridWidth) && (down < gridHeight) && (level[right][down].IsValid())){SE = true;}
			level[xPos][yPos].PushDirections(NW,N,NE,E,SE,S,SW,W);
		}
				
		
		
		public function CreateLevel():void{
			level = new Array();
			tileWidth = levelWidth / gridWidth;
			tileHeight = levelHeight / gridHeight;
			for (var i:int = 0; i < gridWidth; i++){
				level[i] = new Array();
				for (var j:int = 0; j < gridHeight; j++){
					var tile = new Tile(i,j);
					tile.width = tileWidth;
					tile.height = tileHeight;
					tile.addEventListener("tileChange",TileChange);
					tile.addEventListener("tileHover",TileHover);
					level[i][j] = tile;
					level[i][j].x = tileWidth * i;
					level[i][j].y = tileHeight * j;
					lGame.addChild(level[i][j]);
				}
			}
		}

	}
	
}
