package gui {
	
	import flash.events.MouseEvent;
	import flash.events.Event;
	import states.StateMachine;
	import states.Menu;
	import core.GameData;
	import components.TileColorChangerWidget;
	
	public class PauseWindow extends GenericWindow{
		
		private var statemachine:StateMachine;
		private var gamedata:GameData;
		private var bMenu:GenericButton;
		private var bClearGrid:GenericButton;
		private var bFillGrid:GenericButton;
		private var bHelp:GenericButton;

		public var colorwidget:TileColorChangerWidget;
		
		public function PauseWindow(statemachine:StateMachine,gamedata:GameData,windowName:String, xPos:int, yPos:int):void {
			this.statemachine = statemachine;
			this.gamedata = gamedata;
			txtName.text = windowName;
			bBack.txtName.text = "Back";
			this.x = xPos - width/2;
			this.y = yPos - height/2;
			bMenu = new GenericButton();
			bMenu.txtName.text = "Quit";
			bMenu.x = 112;
			bMenu.y = 344;
			this.addChild(bMenu);
			
			colorwidget = new TileColorChangerWidget(gamedata);
			colorwidget.y = 55;
			this.addChild(colorwidget);
			bFillGrid = new GenericButton();
			bFillGrid.txtName.text = "Fill";
			bFillGrid.x = 112;
			bFillGrid.y = 194;
			this.addChild(bFillGrid);
			bClearGrid = new GenericButton();
			bClearGrid.txtName.text = "Clear";
			bClearGrid.x = 112;
			bClearGrid.y = 244;
			this.addChild(bClearGrid);
			bHelp = new GenericButton();
			bHelp.txtName.text = "Help";
			bHelp.x = 112;
			bHelp.y = 294;
			this.addChild(bHelp);
		}
		
		public function AddListeners():void{
			bBack.addEventListener(MouseEvent.CLICK, BBack,false,0,true);
			bMenu.addEventListener(MouseEvent.CLICK, BMenu,false,0,true);
			bHelp.addEventListener(MouseEvent.CLICK, BHelp,false,0,true);
			bClearGrid.addEventListener(MouseEvent.CLICK, BClearGrid,false,0,true);
			bFillGrid.addEventListener(MouseEvent.CLICK, BFillGrid,false,0,true);
		}
		
		public function RemoveListeners():void{
			bBack.removeEventListener(MouseEvent.CLICK,BBack);
			bMenu.removeEventListener(MouseEvent.CLICK,BMenu);
			bHelp.removeEventListener(MouseEvent.CLICK, BHelp);
			bClearGrid.removeEventListener(MouseEvent.CLICK, BClearGrid);
			bFillGrid.removeEventListener(MouseEvent.CLICK, BFillGrid);
		}
		
		private function BBack(e:MouseEvent):void{
			RemoveListeners();
			colorwidget.Delete();
			statemachine.GotoPreviousState();
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
		}
		
		private function BMenu(e:MouseEvent):void{
			RemoveListeners();
			var menuState:Menu = new Menu(statemachine,gamedata);
			statemachine.SetNextState(menuState);
			statemachine.GotoNextState();
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
		}
		
		private function BHelp(e:MouseEvent):void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
			dispatchEvent(new Event("loadHelp"));
		}
		private function BClearGrid(e:MouseEvent):void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
			gamedata.grid.ClearGrid();
		}
		private function BFillGrid(e:MouseEvent):void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
			gamedata.grid.FillGrid();
		}
		
		
	}
	
}
