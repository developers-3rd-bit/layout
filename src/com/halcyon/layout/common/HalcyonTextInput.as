package com.halcyon.layout.common
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class HalcyonTextInput extends EventDispatcher
   {
      public static const TEXT_CHANGE:String = "textChange";
      
      private var _mcTextInputBorder:McTextInputBorder;
      private var _textField:TextField;
      
      public function HalcyonTextInput(argWidth:Number, argheight:Number = 20)
      {
         _mcTextInputBorder = new McTextInputBorder();
         _mcTextInputBorder.width = argWidth;
         _mcTextInputBorder.height = argheight;
         _textField = new TextField();
         _textField.type = TextFieldType.INPUT;
         _textField.width = _mcTextInputBorder.getBounds(_mcTextInputBorder).width - 10;
         _textField.height = _mcTextInputBorder.height - 2;
         _textField.x = 10;
         _textField.y = -9;
         _textField.addEventListener(Event.CHANGE, inputEventCapture);
         _mcTextInputBorder.addChild(_textField);
      }
      
      public function inputEventCapture(event:Event):void 
      {
         this.dispatchEvent(new LayoutEvent(TEXT_CHANGE, false, false, _textField.text ));
      }
      
      public function get content():MovieClip 
      {
         return _mcTextInputBorder;
      }
      
      /**
       * @param value indicates whether this control is used for entering passwords.
       */ 
      public function set displayAsPassword(value:Boolean):void 
      {
         _textField.displayAsPassword = value;
      }
      
      public function get text():String
      {
         return _textField.text;
      }
      
      /**
       * @param value is the Plain text that appears in the control.
       */ 
      public function set text(value:String):void
      {
         _textField.text = value;
      }
   }
   
}