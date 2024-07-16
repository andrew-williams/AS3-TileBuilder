package states 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import gui.HUD;
	import core.GameData;
	import components.ScrollSprite;
	import components.TileTooltip;
	import components.Grid;
	
	public class GameState extends State
	{
		// Core
		private var statemachine:StateMachine;
		private var gamedata:GameData;
		
		// Game
		//private var grid:Grid;
		private var tileTooltip:TileTooltip;
		private var tooltipCooldown:int = 0;
		private var seconds:int = 0;
		private var hud:HUD;
		
		private var scrollSprite:ScrollSprite;
		
		// Layers
		private var cloudLayer:Sprite;
		private var gameLayer:Sprite;
		private var hudLayer:Sprite;
		private var bgLayer:Sprite;
		
		public function GameState(statemachine:StateMachine,gamedata:GameData) :void
		{
			
			allowOverlay = true;
			
			this.gamedata = gamedata;
			this.statemachine = statemachine;
			this.alpha = 0;
			
			gameLayer = new Sprite();
			hudLayer = new Sprite();
			cloudLayer = new Sprite();
			bgLayer = new Sprite();
			gamedata.grid = new Grid(gamedata.levelWidth,gamedata.levelHeight,gamedata.gridWidth,gamedata.gridHeight,gamedata.tileDefinitions,gamedata.tileDescriptions);
			gameLayer.addChild(gamedata.grid);
			InitClouds();
			hud = new HUD(gamedata.soundmanager);
			hudLayer.addChild(hud);
			tileTooltip = new TileTooltip();
			hudLayer.addChild(tileTooltip);
			
			var bg:Background = new Background();
			bgLayer.addChild(bg);
			this.addChild(bgLayer);
			this.addChild(gameLayer);
			cloudLayer.mouseChildren = false;
			cloudLayer.mouseEnabled = false;
			this.addChild(cloudLayer);
			this.addChild(hudLayer);
		}
		
		private function InitClouds():void{
			scrollSprite = new ScrollSprite(gamedata.levelWidth,gamedata.levelHeight);
			var cloudI:Clouds = new Clouds();
			var cloudII:Clouds = new Clouds();
			cloudI.alpha = 0.4;
			cloudII.alpha = 0.4;
			scrollSprite.AddSprite(cloudI,0,0);
			scrollSprite.AddSprite(cloudII,cloudII.width * -1,0);
			cloudLayer.addChild(cloudI);
			cloudLayer.addChild(cloudII);
		}
		
		
		override public function Enter():void {
			gamedata.grid.ChangeTileColor(gamedata.tileColor);
			gamedata.grid.UpdateGrid();
			gamedata.grid.addEventListener("playSound",PlaySound,false,0,true);
			hud.addEventListener("Pause",BPause,false,0,true);
			hud.AddListeners();
		}
		override public function Exit():void{
			hud.removeEventListener("Pause",BPause);
			hud.RemoveListeners();
		}
	
		override public function MouseDown():void{
			tileTooltip.HideTooltip();
		}
		override public function MouseMove():void{

			tooltipCooldown = 0;
			tileTooltip.HideTooltip();
			
		}
		
		override public function Tick():void{
			seconds++;
			if (tooltipCooldown > 1){
				tooltipCooldown = 1;
				tileTooltip.ShowTooltip();
				tileTooltip.UpdateTooltip(gamedata.grid.hoverID,gamedata.grid.hoverDesc);
				tileTooltip.x = gamedata.mXPos;
				tileTooltip.y = gamedata.mYPos;
			}
			else{
				tooltipCooldown++;
			}
		}
	
		override public function Update():void{
			hud.PushStatistics(gamedata.grid.activeTiles,gamedata.totalClicks,gamedata.mXPos,gamedata.mYPos,seconds);
			hud.Update();
			scrollSprite.Update();
		}
		
		private function BPause(e:Event):void{
			var pauseState:Pause = new Pause(statemachine,gamedata);
			statemachine.SetNextState(pauseState);
			statemachine.GotoNextState();
		}
		
		private function PlaySound(e:Event):void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndPipe1());
		}
		
	}

}