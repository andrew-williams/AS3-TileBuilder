package gui {
	
	import flash.events.MouseEvent;
	import flash.events.Event;
	import states.StateMachine;
	import core.GameData;
	import components.TileColorChangerWidget;
	import components.NumericStepper;
	
	public class SettingsWindow extends GenericWindow{
		
		private var statemachine:StateMachine;
		private var gamedata:GameData;
		private var gridHeight:NumericStepper;
		private var gridWidth:NumericStepper;
		public var colorwidget:TileColorChangerWidget;

		public function SettingsWindow(statemachine:StateMachine,gamedata:GameData,windowName:String, xPos:int, yPos:int):void {
			this.statemachine = statemachine;
			this.gamedata = gamedata;
			txtName.text = windowName;
			bBack.txtName.text = "Back";
			this.x = xPos - width/2;
			this.y = yPos - height/2;
			InitGridStepper();
			InitColorWidget();
		}
		
		private function InitColorWidget():void{
			colorwidget = new TileColorChangerWidget(gamedata);
			colorwidget.y = 160;
			this.addChild(colorwidget);
		}
		
		private function InitGridStepper():void{
			gridHeight = new NumericStepper("Grid Height");
			gridHeight.enabled = false;
			gridHeight.maximum = 40;
			gridHeight.minimum = 20;
			gridHeight.stepSize = 5;
			gridHeight.SetValue(gamedata.gridHeight);			
			gridHeight.x = 140;
			gridHeight.y = 50;
			gridWidth = new NumericStepper("Grid Width");
			gridWidth.enabled = false;
			gridWidth.maximum = 40;
			gridWidth.minimum = 20;
			gridWidth.stepSize = 5;
			gridWidth.SetValue(gamedata.gridWidth);
			gridWidth.x = 140;
			gridWidth.y = 100;
			this.addChild(gridHeight);
			this.addChild(gridWidth);
		}
		
		public function AddListeners():void{
			trace("Adding listenres");
			gridHeight.enabled = true;
			gridWidth.enabled = true;
			bBack.addEventListener(MouseEvent.CLICK, BBack,false,0,true);
			gridWidth.GetIncreaseButton().addEventListener(MouseEvent.CLICK, IncreaseGridWidth,false,0,true);
			gridWidth.GetDecreaseButton().addEventListener(MouseEvent.CLICK, DecreaseGridWidth,false,0,true);
			gridHeight.GetIncreaseButton().addEventListener(MouseEvent.CLICK, IncreaseGridHeight,false,0,true);
			gridHeight.GetDecreaseButton().addEventListener(MouseEvent.CLICK, DecreaseGridHeight,false,0,true);
		}
		
		private function BBack(e:MouseEvent):void{
			gridHeight.enabled = false;
			gridWidth.enabled = false;
			bBack.removeEventListener(MouseEvent.CLICK,BBack);
			gridWidth.GetIncreaseButton().removeEventListener(MouseEvent.CLICK, IncreaseGridWidth);
			gridWidth.GetDecreaseButton().removeEventListener(MouseEvent.CLICK, DecreaseGridWidth);
			gridHeight.GetIncreaseButton().removeEventListener(MouseEvent.CLICK, IncreaseGridHeight);
			gridHeight.GetDecreaseButton().removeEventListener(MouseEvent.CLICK, DecreaseGridHeight);
			statemachine.GotoPreviousState();
		}
		
		private function IncreaseGridWidth(e:Event):void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
			gridWidth.IncreaseValue();
			gamedata.gridWidth = gridWidth.GetValue();
		}
		private function DecreaseGridWidth(e:Event):void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
			gridWidth.DecreaseValue();
			gamedata.gridWidth = gridWidth.GetValue();
		}
		private function IncreaseGridHeight(e:Event):void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
			gridHeight.IncreaseValue();
			gamedata.gridHeight = gridHeight.GetValue();
		}
		private function DecreaseGridHeight(e:Event):void{
			gamedata.soundmanager.StopSFXChannel();
			gamedata.soundmanager.PlaySFX(new sndClick());
			gridHeight.DecreaseValue();
			gamedata.gridHeight = gridHeight.GetValue();
		}
	}
	
}
