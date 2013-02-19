package com.halcyon.layout.common
{
   import flash.display.MovieClip;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   
   public class HalcyonSliderSwitch extends EventDispatcher
   {
      public static const SLIDER_STATE_CHANGE:String = "sliderStateChange";
      
      private var _mcSliderSwitch:McSliderSwitch;
      private var _currentLabel:String = "";
      private var _unselectedLabel:String;
      private var _selectedLabel:String;
      private var _labelInitial:String;
      private var _enabled:Boolean = true;
      
      public function HalcyonSliderSwitch(initialLabel:String, selectedLabel:String, unselectedLabel:String, argWidth:Number = 60, argHeight:Number = 18)
      {
         _labelInitial = initialLabel;
         _selectedLabel = selectedLabel;
         _unselectedLabel = unselectedLabel;
         _mcSliderSwitch = new McSliderSwitch();
         _mcSliderSwitch.width = argWidth;
         _mcSliderSwitch.height = argHeight;
         if (_enabled) _mcSliderSwitch.addEventListener(MouseEvent.CLICK, handleClick);
      }
      
      public function get content():MovieClip 
      {
         return _mcSliderSwitch;
      }
      
      /**
       * @param value specifies the label when it's in selected state.
       */ 
      public function set selectedLabel(value:String):void 
      {
         _selectedLabel = value;
      }
      
      /**
       * @param value specifies the label when it's in unselected state.
       */ 
      public function set unselectedLabel(value:String):void 
      {
         _unselectedLabel = value;
      }
      
      private function handleClick(e:MouseEvent):void
      {
         if(_mcSliderSwitch.currentLabel == _labelInitial || _mcSliderSwitch.currentLabel == _unselectedLabel)
         {
            _mcSliderSwitch.gotoAndPlay(_selectedLabel);
            _currentLabel = _selectedLabel;
         } 
         else if(_mcSliderSwitch.currentLabel == _selectedLabel)
         {
            _mcSliderSwitch.gotoAndPlay(_unselectedLabel);
            _currentLabel = _unselectedLabel;
         }
         this.dispatchEvent(new LayoutEvent(SLIDER_STATE_CHANGE, false, false, { selected:this.selected, currentLabel:_currentLabel } ));
      }
      
      public function get selected():Boolean
      {
         return (_currentLabel == _selectedLabel);
      }
      
      /**
       * @param value specifies whether set the button's state to selected or unselected.
       */ 
      public function set selected(value:Boolean):void
      {
         _currentLabel = (value?_selectedLabel:_unselectedLabel);
         _mcSliderSwitch.gotoAndPlay(_currentLabel);
      }
      
      /**
       * @param value indicates whether SliderSwitch should listen to mouse click or not.
       */ 
      public function set enabled(value:Boolean):void
      {
         _enabled = value;
         if (_enabled)
         {
            if (!_mcSliderSwitch.hasEventListener(MouseEvent.CLICK)) _mcSliderSwitch.addEventListener(MouseEvent.CLICK, handleClick);
         } 
         else
         {
            if (_mcSliderSwitch.hasEventListener(MouseEvent.CLICK)) _mcSliderSwitch.removeEventListener(MouseEvent.CLICK, handleClick);
         }
      }
      
      /**
       * @param value specifies the width of the component, in pixels, in the parent's coordinates.
       */ 
      public function set width(value:Number):void 
      {
         _mcSliderSwitch.width = value;
      }
      
      /**
       * @param value specifies the height of the component, in pixels, in the parent's coordinates.
       */ 
      public function set height(value:Number):void 
      {
         _mcSliderSwitch.height = value;
      }
      
   }
   
}