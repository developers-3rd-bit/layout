package com.halcyon.layout.common
{
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   
   public class HalcyonTickBox extends EventDispatcher
   {
      public static const TICKBOX_STATE_CHANGE:String = "tickBoxStateChange";
      
      private var _mcTickBox:McTickBox;
      private var _labelField:HalcyonLabel;
      private var _sprite:Sprite;
      private var _isSelected:Boolean = false;
      private var _enabled:Boolean = true;
      
      public function HalcyonTickBox(argLabel:String = null)
      {
         _mcTickBox = new McTickBox();
         _mcTickBox.getChildAt(1).visible = false;
         if (_enabled) _mcTickBox.addEventListener(MouseEvent.CLICK, handleClick);
         _labelField = new HalcyonLabel();
         _labelField.mouseEnabled = false;
         if(argLabel != null)
            _labelField.label = argLabel;
         _labelField.fontSize = 9;
         _sprite = new Sprite();
         _sprite.addChild(_mcTickBox);
         _labelField.y = -8;
         _labelField.x = _mcTickBox.x + _mcTickBox.width - 7;
         _sprite.addChild(_labelField);
      }
      
      public function get content():Sprite 
      {
         return _sprite;
      }
      
      /**
       * @param value is the text to appear on the Button control.
       */ 
      public function set label(value:String):void 
      {
         _labelField.label = value;
      }
      
      private function handleClick(e:MouseEvent):void
      {
         _isSelected = !_isSelected;
         _mcTickBox.getChildAt(1).visible = _isSelected;
         this.dispatchEvent(new LayoutEvent(TICKBOX_STATE_CHANGE, false, false, _isSelected));
      }
      
      public function get selected():Boolean
      {
         return _isSelected;
      }
      
      /**
       * @param value indicates whether the box is displaying a check mark.
       */ 
      public function set selected(value:Boolean):void
      {
         _isSelected = value;
         _mcTickBox.getChildAt(1).visible = value;
      }
      
      /**
       * @param value indicates whether TickBox should listen to mouse click or not.
       */ 
      public function set enabled(value:Boolean):void
      {
         _enabled = value;
         if (_enabled)
         {
            if (!_mcTickBox.hasEventListener(MouseEvent.CLICK)) _mcTickBox.addEventListener(MouseEvent.CLICK, handleClick);
         } 
         else
         {
            if (_mcTickBox.hasEventListener(MouseEvent.CLICK)) _mcTickBox.removeEventListener(MouseEvent.CLICK, handleClick);
         }
      }
      
   }
   
}