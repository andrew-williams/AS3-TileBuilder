package core {
	
	import media.SoundManager;
	import components.Grid;
	
	public class GameData {
		
		public var totalClicks:Number = 0;
		
		// Sound
		public var soundmanager:SoundManager;
		public var sfxVolume:Number = 0.4;
		public var bgmVolume:Number = 0.4;
		
		// Level
		public var grid:Grid;
		public var gridHeight:Number = 30;
		public var gridWidth:Number = 40;
		public var levelHeight:Number;
		public var levelWidth:Number;
		public var tileDefinitions:TileDefinitions;
		public var tileDescriptions:TileDescriptions;
		public var tileColor:uint = 0xFFFFFF;
		
		// Mousedata
		public var mXPos:Number;
		public var mYPos:Number;
		
		public function GameData():void{
			tileDefinitions = new TileDefinitions();
			tileDescriptions = new TileDescriptions();
			
			soundmanager = new SoundManager();
			soundmanager.AdjustBGMVolume(bgmVolume);
			soundmanager.AdjustSFXVolume(sfxVolume);
			
		}

	}
	
}
