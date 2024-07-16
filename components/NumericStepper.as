package components {
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class NumericStepper extends Sprite {

		public var enabled:Boolean = true;		
		public var maximum:Number = 100;
		public var minimum:Number = 0;
		public var stepSize:Number = 1;
		private var value:Number = 0;
		private var bDecrease:DecreaseButton;
		private var bIncrease:IncreaseButton;
		private var displayarea:Sprite;
		private var displayvalue:TextField;
		private var entityName:String;
		private var nameDisplay:TextField;
		// Layers
		private var textLayer:Sprite;
		private var guiLayer:Sprite;
		
		public function NumericStepper(objectName:String = "Undefined") {
			// constructor code
			bDecrease = new DecreaseButton();
			bIncrease = new IncreaseButton();
			textLayer = new Sprite();
			guiLayer = new Sprite();
			entityName = objectName;
			displayarea = new Sprite();
			displayarea.graphics.beginFill(0xFFFFFFF);
			displayarea.graphics.drawRect(0,0,32,32);
			displayarea.x = 32;
			displayvalue = new TextField();
			displayvalue.selectable = false;
			displayvalue.text = value.toString();
			displayvalue.x = 8;
			displayvalue.y = 8;
			displayarea.addChild(displayvalue);
			guiLayer.addChild(displayarea);
			bIncrease.x = 64;
			guiLayer.addChild(bDecrease);
			guiLayer.addChild(bIncrease);
			
			nameDisplay = new TextField();
			nameDisplay.selectable = false;
			nameDisplay.text = entityName;
			nameDisplay.textColor = 0xFFFFFF;
			textLayer.addChild(nameDisplay);
			guiLayer.y = 20;
			this.addChild(textLayer);
			this.addChild(guiLayer);
			
			
		}
		
		public function IncreaseValue():void{
			if (enabled){
				var newValue = value + stepSize;
				SetValue(newValue);
			}
		}
		public function DecreaseValue():void{
			if (enabled){
				var newValue = value - stepSize;
				SetValue(newValue);
			}
		}
		
		public function SetValue(value:Number):void{
			this.value = value;
			if (this.value >= maximum){this.value = maximum}
			if (this.value <= minimum){this.value = minimum}
			displayvalue.text = this.value.toString();
			
		}
		
		public function GetValue():Number{
			return value;
		}
		
		public function GetDecreaseButton():DecreaseButton{
			return bDecrease;
		}
		public function GetIncreaseButton():IncreaseButton{
			return bIncrease;
		}

	}
	
}
