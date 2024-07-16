package components {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.display.Sprite;
	import core.TileDefinitions;
	import core.TileDescriptions;
	
	public class Tile extends MovieClip{

		private var tileData:int;
		private var levelData:Array;
		private var tileX:int;
		private var tileY:int;
		private var description:String = "This is a cleared tile.";
		// Tile surroundings
		private var validTile:Boolean = false;
		private var NW:Boolean = false;
		private var N:Boolean = false;
		private var NE:Boolean = false;
		private var E:Boolean = false;
		private var SE:Boolean = false;
		private var S:Boolean = false;
		private var SW:Boolean = false;
		private var W:Boolean = false;
		private var noclick:Boolean = false;
		
		public function Tile(xLoc:int,yLoc:int,noClick:Boolean = false):void {
			noclick = noClick;
			tileData = 1;
			tileX = xLoc;
			tileY = yLoc;
			tileMask.alpha = 0;
			this.gotoAndStop(1);
			this.addEventListener(MouseEvent.CLICK,Clicked,false,0,true);
			this.addEventListener(MouseEvent.MOUSE_OVER, MouseOver,false,0,true);
		}
 
		public function ChangeColor(tileColor:uint):void{
			var newCol:ColorTransform = new ColorTransform();
			newCol.color=tileColor;
			newCol.alphaMultiplier = 0.5;
			if (tileColor == 0xFFFFFF){
				tileMask.visible = false;
			}
			else{
				tileMask.visible = true;
			}
			tileMask.transform.colorTransform = newCol;
		}
		
		public function IsValid():Boolean{
			return validTile;
		}
		
		public function PushDirections(nw:Boolean,n:Boolean,ne:Boolean,e:Boolean,se:Boolean,s:Boolean,sw:Boolean,w:Boolean):void{
			NW = nw;
			N = n;
			NE = ne;
			E = e;
			SE = se;
			S = s;
			SW = sw;
			W = w;
		}
		
		public function ClearTile():void{
			validTile = false; 
			ChangeColor(0xFFFFFF);
			NW = false;
			N = false;
			NE = false;
			E = false;
			SE = false;
			S = false;
			SW = false;
			W = false;
			tileData = 1;
			this.gotoAndStop(1);
			description = "This is a cleared tile.";
		}
		
		public function ChangeTile(td:TileDefinitions,tdesc:TileDescriptions):void{
			//Fill
			if ((N) && (NE) && (E) && (SE) && (S) && (SW) && (W) && (NW)){tileData = td.FILL}
			//Single Entrance
			else if ((N) && (!E) && (!S) && (!W)){tileData = td.OPEN8;}
			else if ((!N) && (!E) && (S) && (!W)){tileData = td.OPEN2;}
			else if ((!N) && (E) && (!S) && (!W)){tileData = td.OPEN6;}
			else if ((!N) && (!E) && (!S) && (W)){tileData = td.OPEN4;}
			//Open x2
			else if ((N) && (!E) && (S) && (!W)){tileData = td.OPEN28;}
			else if ((!N) && (E) && (!S) && (W)){tileData = td.OPEN46;}
			else if ((!N) && (!E) && (S) && (!SW) && (W)){tileData = td.OPEN24;}
			else if ((!NW) && (N) && (!E) && (!S) && (W)){tileData = td.OPEN48;}
			else if ((N) && (!NE) && (E) && (!S) && (!W)){tileData = td.OPEN68;}
			else if ((!N) && (E) && (!SE) && (S) && (!W)){tileData = td.OPEN26;}
			//Open x3
			else if ((!N) && (!E) && (S) && (SW) && (W)){tileData = td.OPEN124;}
			else if ((!N) && (E) && (SE) && (S) && (!W)){tileData = td.OPEN236;}
			else if ((!N) && (E) && (!SE) && (S) && (!SW) && (W)){tileData = td.OPEN246;}
			else if ((N) && (!NW) && (!E) && (!SW) && (S) && (W)){tileData = td.OPEN248;}
			else if ((N) && (E) && (S) && (!SE) && (!W) && (!NE)){tileData = td.OPEN268;}
			else if ((N) && (E) && (!S) && (W) && (!NW) && (!NE)){tileData = td.OPEN468;}
			else if ((N) && (!E) && (!S) && (W) && (NW)){tileData = td.OPEN478;}
			else if ((N) && (NE) && (E) && (!S) && (!W)){tileData = td.OPEN689;}
			//Open x4
			else if ((!N) && (E) && (S) && (W) && (SW) && (!SE)){tileData = td.OPEN1246;}
			else if ((N) && (!E) && (S) && (W) && (SW) && (!NW)){tileData = td.OPEN1248;}
			else if ((!N) && (E) && (S) && (W) && (!SW) && (SE)){tileData = td.OPEN2346;}
			else if ((N) && (E) && (S) && (!W) && (SE) && (!NE)){tileData = td.OPEN2368;}
			else if ((N) && (E) && (S) && (W)&& (!SW) && (!SE) && (!NE) && (!NW)){tileData = td.OPEN2468;}
			else if ((N) && (!E) && (S) && (W) && (!SW) && (NW)){tileData = td.OPEN2478;}
			else if ((N) && (E) && (S) && (!W) && (!SE) && (NE)){tileData = td.OPEN2689;}
			else if ((N) && (E) && (!S) && (W) && (NW) && (!NE)){tileData = td.OPEN4678;}
			else if ((N) && (E) && (!S) && (W) && (!NW) && (NE)){tileData = td.OPEN4689;}
			//Open x5
			else if ((!N) && (E) && (S) && (W) && (SW) && (SE)){tileData = td.OPEN12346;}
			else if ((N) && (E) && (S) && (W) && (SW) && (!SE) && (!NE) && (!NW)){tileData = td.OPEN12468;}
			else if ((N) && (!E) && (S) && (W) && (NW) && (SW)){tileData = td.OPEN12478;}
			else if ((N) && (E) && (S) && (W) && (!SW) && (SE) && (!NE) && (!NW)){tileData = td.OPEN23468;}
			else if ((N) && (E) && (S) && (!W) && (NE) && (SE)){tileData = td.OPEN23689;}
			else if ((N) && (E) && (S) && (W) && (!SW) && (!SE) && (!NE) && (NW)){tileData = td.OPEN24678;}
			else if ((N) && (E) && (S) && (W) && (!SW) && (!SE) && (NE) && (!NW)){tileData = td.OPEN24689;}
			else if ((N) && (E) && (!S) && (W) && (NW) && (NE)){tileData = td.OPEN46789;}
			//Open x6
			else if ((N) && (E) && (S) && (W)&& (SW) && (SE) && (!NE) && (!NW)){tileData = td.OPEN123468;}
			else if ((N) && (E) && (S) && (W)&& (SW) && (!SE) && (!NE) && (NW)){tileData = td.OPEN124678;}
			else if ((N) && (E) && (S) && (W)&& (SW) && (!SE) && (NE) && (!NW)){tileData = td.OPEN124689;}
			else if ((N) && (E) && (S) && (W)&& (!SW) && (SE) && (!NE) && (NW)){tileData = td.OPEN234678;}
			else if ((N) && (E) && (S) && (W)&& (!SW) && (SE) && (NE) && (!NW)){tileData = td.OPEN234689;}
			else if ((N) && (E) && (S) && (W)&& (!SW) && (!SE) && (NE) && (NW)){tileData = td.OPEN246789;}
			//Open x7
			else if ((N) && (E) && (S) && (W)&& (SW) && (SE) && (!NE) && (NW)){tileData = td.OPEN1234678;}
			else if ((N) && (E) && (S) && (W)&& (SW) && (SE) && (NE) && (!NW)){tileData = td.OPEN1234689;}
			else if ((N) && (E) && (S) && (W)&& (SW) && (!SE) && (NE) && (NW)){tileData = td.OPEN1246789;}
			else if ((N) && (E) && (S) && (W)&& (!SW) && (SE) && (NE) && (NW)){tileData = td.OPEN2346789;}
			else{tileData = td.SINGLE;}
			description = tdesc.GetDescription(tileData);
			this.gotoAndStop(tileData);
		}
		
		public function GetX():int{
			return tileX;
		}
		public function GetY():int{
			return tileY;
		}
		
		public function GetTileData():int{
			return tileData;
		}
		
		public function GetTileDescription():String{
			return description;
		}
		public function ChangeTileDisplay():void{
			this.gotoAndStop(tileData);
		}
		
		public function ChangeTileData(tileID:int){
			tileData = tileID;
		}
		
		public function SetValid():void{
			validTile = true;
		}
		
		private function Clicked(e:MouseEvent):void{
			if ((validTile) && (!noclick)){
				ClearTile();
				dispatchEvent(new Event("tileChange"));
			}
			else if ((!validTile) && (!noclick)){
				validTile = true;
				dispatchEvent(new Event("tileChange"));
			}
		}
		
		private function MouseOver(e:MouseEvent):void{
			dispatchEvent(new Event("tileHover"));
		}

	}
	
}
