package com.halcyon.layout.common
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   import flashx.textLayout.formats.TextAlign;
   
   public class HalcyonTab extends Sprite
   {
      private var _label:String = "";
      private var _labelField:TextField;
      private var _textFormat:TextFormat;
      private var _leftVerticalLine:HalcyonLine;
      private var _rightVerticalLine:HalcyonLine;
      private var _topHorizontalLine:HalcyonLine;
      private var _bottomHorizontalLine:HalcyonLine;
      private var _hGroup:HalcyonHGroup;
      private var _vGroup:HalcyonVGroup;
      private var _labelCanvas:HalcyonCanvas;
      
      public function HalcyonTab(argLabel:String = "", argWidth:Number = NaN)
      {
         _label = argLabel;
         this.buttonMode = true;
         _labelField = new TextField();
         _labelField.mouseEnabled = false;
         _labelField.text = _label;
         _labelField.textColor = 0x00FF00;
         _labelField.height = 15;
         _textFormat = new TextFormat();
         _textFormat.align = TextAlign.CENTER;
         _textFormat.size = 8;
         _textFormat.bold = true;
         _labelField.setTextFormat(_textFormat);
         _vGroup = new HalcyonVGroup(this);
         _vGroup.verticalGap = 0;
         _hGroup = new HalcyonHGroup(this);
         _hGroup.top = 0;
         _topHorizontalLine = new HalcyonLine();
         _vGroup.addChild(_topHorizontalLine);
         _leftVerticalLine = new HalcyonLine();
         _leftVerticalLine.drawVerticalLine(16);
         _hGroup.addChild(_leftVerticalLine);
         _labelCanvas = new HalcyonCanvas(_hGroup);
         _labelCanvas.top = 1.5;
         _labelCanvas.addChild(_labelField);
         _hGroup.addChild(_labelCanvas);
         _rightVerticalLine = new HalcyonLine();
         _rightVerticalLine.drawVerticalLine(16);
         _hGroup.addChild(_rightVerticalLine);
         _vGroup.addChild(_hGroup);
         _bottomHorizontalLine = new HalcyonLine();
         _topHorizontalLine.drawHorizontalLine(_rightVerticalLine.x);
         _bottomHorizontalLine.drawHorizontalLine(_rightVerticalLine.x);
         _vGroup.addChild(_bottomHorizontalLine);
         _leftVerticalLine.visible = false;
         _rightVerticalLine.visible = false;
         _topHorizontalLine.visible = false;
         this.addChild(_vGroup);
         width = argWidth;
         this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
         this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
      }
      
      /**
       * @param value specifies the tab to be selected.
       */ 
      public function set active(argObject:Object):void 
      {
         if (argObject == this) 
         {
            _leftVerticalLine.visible = true;
            _rightVerticalLine.visible = true;
            _topHorizontalLine.visible = true;
            _bottomHorizontalLine.visible = false;
            _labelField.textColor = 0x000000;
            this.buttonMode = false;
            this.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            this.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
         } 
         else 
         {
            _leftVerticalLine.visible = false;
            _rightVerticalLine.visible = false;
            _topHorizontalLine.visible = false;
            _bottomHorizontalLine.visible = true;
            this.buttonMode = true;
            _labelField.textColor = 0x00FF00;
            this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
         }
      }
      
      /**
       * @param value is the text to appear on the Tab.
       */ 
      public function set label(value:String):void 
      {
         if (_label == value) return;
         _label = value;
         _labelField.text = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function get label():String 
      {
         return _label;
      }
      
      /**
       * @param value specifies the width of the component, in pixels, in the parent's coordinates.
       */ 
      public function set tabWidth(value:Number):void 
      {
         width = value;
         _labelCanvas.width = _labelField.width;
         _hGroup.refresh();
         _topHorizontalLine.drawHorizontalLine(_rightVerticalLine.x);
         _bottomHorizontalLine.drawHorizontalLine(_rightVerticalLine.x);
      }
      
      private function onMouseOver(event:Event):void 
      {
         _labelField.textColor = 0x0000FF;
      }
      
      private function onMouseOut(event:Event):void 
      {
         _labelField.textColor = 0x00FF00;
      }
   }
}