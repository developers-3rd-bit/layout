package com.halcyon.layout.common
{
   import flash.display.BlendMode;
   import flash.display.CapsStyle;
   import flash.display.Sprite;
   
   public class HalcyonLine extends Sprite
   {
      public function HalcyonLine()
      {
         super();
      }
      
      /**
       * @param argX indicates the horizontal position relative to the registration point of the parent display object (in pixels).
       */
      public function drawHorizontalLine(argX:Number):void 
      {
         graphics.clear();
         graphics.lineStyle(1, 0x000000, .5, false, BlendMode.NORMAL, CapsStyle.NONE);
         graphics.moveTo(0, 0);
         graphics.lineTo(argX, 0);
      }
      
      /**
       * @param argY indicates the vertical position relative to the registration point of the parent display object (in pixels).
       */
      public function drawVerticalLine(argY:Number):void 
      {
         graphics.clear();
         graphics.lineStyle(1, 0x000000, .5, false, BlendMode.NORMAL, CapsStyle.NONE);
         graphics.moveTo(0, 0);
         graphics.lineTo(0, argY);
      }
   }
}