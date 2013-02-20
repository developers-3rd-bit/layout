package com.halcyon.layout.common
{
   import flash.display.DisplayObjectContainer;
   import flash.display.GradientType;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   import flashx.textLayout.formats.TextAlign;
   
   public class HalcyonLabelOnlyButton extends HalcyonCanvas
   {
      private var _labelField:TextField;
      private var _textFormat:TextFormat;
      private var _defaultWidth:Number = 60;
      private var _defaultHeight:Number = 18;
      private var _passedWidth:Number;
      private var _passedHeight:Number;
      
      public function HalcyonLabelOnlyButton(reference:DisplayObjectContainer)
      {
         super(reference, _defaultWidth, _defaultHeight);
         
         drawBackground([0xff0000, 0x000000]);
         
         _labelField = new TextField();
         _textFormat = new TextFormat();
         _textFormat.align = TextAlign.CENTER;
         _textFormat.color = 0xc4c4c4;
         _textFormat.bold = true;
         _labelField.setTextFormat(_textFormat);
         _labelField.mouseEnabled = false;
         _labelField.autoSize = TextFieldAutoSize.CENTER;
         fontSize = 12;
         
         this.prepareElementAndPosition(_labelField, 0, 0, 0, 0);
         
         this.buttonMode = true;
         
         this.addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
         this.addEventListener(MouseEvent.ROLL_OUT, onMouseOut);
      }
      
      override public function set width(value:Number):void {}
      
      override public function set height(value:Number):void {}
      
      /**
       * @param value is the number that specifies the width of the component, in pixels, in the parent's coordinates.
       */
      public function set buttonWidth(value:Number):void
      {
         if(value < 1) return;
         super.width = value;
         _passedWidth = value;
         _labelField.width = value;
         drawBackground([0xff0000, 0x000000]);
      }
      
      /**
       * @param value is the number that specifies the height of the component, in pixels, in the parent's coordinates.
       */ 
      public function set buttonHeight(value:Number):void
      {
         if(value < 1) return;
         super.height = value;
         _passedHeight = value;
         _labelField.height = value;
         drawBackground([0xff0000, 0x000000]);
      }
      
      public function get label():String 
      {
         return _labelField.text;
      }
      
      /**
       * @param value is the text to appear on the Button control.
       */ 
      public function set label(value:String):void 
      {
         _labelField.text = value;
         _labelField.setTextFormat(_textFormat);
         if(isNaN(_passedWidth)) recalculateWidth();
         else this.prepareElementAndPosition(_labelField, (super.height - _labelField.height) / 2, 0, 0, 0);
      }
      
      public function set fontSize(value:Number):void
      {
         if(value < 1) return;
         _textFormat.size = value;
         _labelField.setTextFormat(_textFormat);
         if(isNaN(_passedHeight)) 
            super.height = 18 + value - 10;
         else 
            _labelField.height = value + 2;
         this.prepareElementAndPosition(_labelField, value > 11 ? 0 : 1, 0, 0, 0);
         if(isNaN(_passedWidth)) recalculateWidth();
      }
      
      private function recalculateWidth():void
      {
         super.width = _labelField.width + (_textFormat.size > 12 ? 14 : 10);
         refresh();
         drawBackground([0xff0000, 0x000000]);
      }
      
      private function onMouseOver(event:Event):void 
      {
         drawBackground([0xffffff, 0x7ba02b]);
         _textFormat.color = 0x000000;
         _labelField.setTextFormat(_textFormat);
      }
      
      private function onMouseOut(event:Event):void 
      {
         drawBackground([0xff0000, 0x000000]);
         _textFormat.color = 0xc4c4c4;
         _labelField.setTextFormat(_textFormat);
      }
      
      private function drawBackground(colors:Array):void
      {
         graphics.clear();
         graphics.beginGradientFill(GradientType.LINEAR, colors, [1, .8], [0, 128]);
         graphics.drawRoundRect(0, 0, width, height, 5, 5);
         graphics.endFill();
      }
   }
}