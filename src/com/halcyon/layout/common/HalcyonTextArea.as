package com.halcyon.layout.common
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class HalcyonTextArea extends EventDispatcher
   {
      public static const TEXT_CHANGE:String = "textChange";
      
      private var _mcTextArea:McTextArea;
      private var _textArea:TextField;
      
      public function HalcyonTextArea()
      {
         _mcTextArea = new McTextArea();
         _textArea = _mcTextArea["textArea"] as TextField;
         _textArea.type = TextFieldType.INPUT;
         _textArea.selectable = true;
         _textArea.border = true;
         _textArea.addEventListener(Event.CHANGE, inputEventCapture);
      }
      
      public function inputEventCapture(event:Event):void
      {
         this.dispatchEvent(new LayoutEvent(TEXT_CHANGE, false, false, _textArea.text ));
      }
      
      public function get content():MovieClip 
      {
         return _mcTextArea;
      }
      
      /**
       * @param value specifies the width of the component, in pixels, in the parent's coordinates.
       */ 
      public function set width(value:Number):void 
      {
         _textArea.width = value;
      }
      
      /**
       * @param value specifies the height of the component, in pixels, in the parent's coordinates.
       */ 
      public function set height(value:Number):void 
      {
         _textArea.height = value;
      }
      
      public function get text():String
      {
         return _textArea.text;
      }
      
      /**
       * @param value is the Plain text that appears in the control.
       */ 
      public function set text(value:String):void
      {
         _textArea.text = value;
      }
   }
   
}