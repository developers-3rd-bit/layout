package com.halcyon.layout.common
{
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class HalcyonLabel extends McLabel
   {
      private var _labelField:TextField;
      private var _textFormat:TextFormat;
      
      public function HalcyonLabel(argLabel:String = "", argFontSize:Number = 8)
      {
         _labelField = this["labelField"] as TextField;
         _labelField.mouseEnabled = false;
         _labelField.autoSize = TextFieldAutoSize.LEFT;
         _labelField.text = argLabel;
         _textFormat = new TextFormat();
         fontSize = argFontSize;
      }
      
      /**
       * @param value specifies the plain text displayed by this control. Its appearance is determined by the CSS styles of this Label control.
       */ 
      public function set label(value:String):void 
      {
         if (_labelField.text == value) return;
         _labelField.text = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      public function get label():String 
      {
         return _labelField.text;
      }
      
      /**
       * @param value specifies the color of text in the component, including the component label.
       */ 
      public function set fontColor(value:uint):void 
      {
         _textFormat.color = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      /**
       * @param value specifies the height of the text, in pixels.
       */ 
      public function set fontSize(value:Number):void 
      {
         if(value < 1) return;
         _textFormat.size = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      /**
       * @param value determines whether the text is boldface.
       */ 
      public function set bold(value:Boolean):void 
      {
         _textFormat.bold = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      /**
       * @param value determines whether the text is underlined.
       */ 
      public function set underline(value:Boolean):void 
      {
         _textFormat.underline = value;
         _labelField.setTextFormat(_textFormat);
      }
      
      /**
       * @param value determines whether to wrap the text.
       */ 
      public function set wordWrap(value:Boolean):void 
      {
         _labelField.wordWrap = value;
      }
      
      /**
       * @param value is a string that indicates how a label is sized and aligned to fit the value of its text property. The following are valid values:
       * <br>TextFieldAutoSize.NONE: The label is not resized or aligned to fit the text.
       * <br>TextFieldAutoSize.LEFT: The right and bottom sides of the label are resized to fit the text. The left and top sides are not resized.
       * <br>TextFieldAutoSize.CENTER: The left and right sides of the label resize to fit the text. The horizontal center of the label stays anchored at its original horizontal center position.
       * <br>TextFieldAutoSize.RIGHT: The left and bottom sides of the label are resized to fit the text. The top and right sides are not resized.
       * <br><br>The default value is TextFieldAutoSize.NONE.
       */ 
      public function set autoSize(value:String):void 
      {
         if(value == null) return;
         labelField.autoSize = value;
      }
   }
}