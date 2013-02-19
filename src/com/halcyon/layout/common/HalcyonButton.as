package com.halcyon.layout.common 
{
   
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   import flashx.textLayout.formats.TextAlign;
   
   public class HalcyonButton extends EventDispatcher 
   {
      private var _mcButton:MovieClip;
      private var _labelField:TextField;
      private var _textFormat:TextFormat;
      
      public function HalcyonButton(argButtonClass:Class = null, argLabel:String = "", isActive:Boolean = true):void 
      {
         if (argButtonClass != null) 
         {
            _mcButton = new argButtonClass();
            onMouseOut(null);
         } 
         else 
         {
            _mcButton = new McButton();
            _labelField = (_mcButton.getChildAt(1) as MovieClip).getChildAt(0) as TextField;
            _textFormat = new TextFormat();
            _textFormat.align = TextAlign.CENTER;
            _labelField.setTextFormat(_textFormat);
            _labelField.mouseEnabled = false;
            _labelField.autoSize = TextFieldAutoSize.CENTER;
            _labelField.text = argLabel;
         }
         _mcButton.buttonMode = true;
         _mcButton.addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
         _mcButton.addEventListener(MouseEvent.ROLL_OUT, onMouseOut);
         _mcButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
         _mcButton.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
         
         if (isActive) 
         {
            active = true;
         }
      }	
      
      public function get content():MovieClip 
      {
         return _mcButton;
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
      }
      
      private function onMouseOver(e:Event):void 
      {
         if(_mcButton.currentLabel != 'inactive') 
         {
            _mcButton.gotoAndStop('over');
         }
      }
      
      private function onMouseOut(e:Event):void 
      {
         if(_mcButton.currentLabel != 'inactive') 
         {
            _mcButton.gotoAndStop('up');
         }
      }
      
      private function onMouseDown(e:Event):void 
      {
         if(_mcButton.currentLabel != 'inactive') 
         {
            _mcButton.gotoAndStop('down');
         }
      }
      
      private function onMouseUp(e:Event):void 
      {
         if(_mcButton.currentLabel != 'inactive') 
         {
            _mcButton.gotoAndStop('up');
         }
      }
      
      public function hide():void 
      {
         _mcButton.visible = false;
      }
      
      public function get visible():Boolean 
      {
         return _mcButton.visible;
      }
      
      /**
       * @param isActive specifies whether this button should be listening to mouse click or not.
       */ 
      public function set active(isActive:Boolean):void 
      {
         if (isActive) 
         {
            _mcButton.visible = true;
            _mcButton.gotoAndStop('up');
            _mcButton.useHandCursor = true;
            _mcButton.addEventListener(MouseEvent.CLICK, onMouseClick);
            return;
         }
         _mcButton.visible = true;
         _mcButton.gotoAndStop('inactive');
         _mcButton.useHandCursor = false;
         if (_mcButton.hasEventListener(MouseEvent.CLICK)) 
         {
            _mcButton.removeEventListener(MouseEvent.CLICK, onMouseClick);
         }
      }
      
      private function onMouseClick(e:Event):void 
      {
         dispatchEvent(new MouseEvent(MouseEvent.CLICK));
      }
      
      /**
       * @param value is the number that specifies the height of the component, in pixels, in the parent's coordinates.
       */ 
      public function set height(value:Number):void 
      {
         _mcButton.height = value;
      }
      
      /**
       * @param value is the number that specifies the width of the component, in pixels, in the parent's coordinates.
       */
      public function set width(value:Number):void 
      {
         _mcButton.width = value;
      }
      
   }
}