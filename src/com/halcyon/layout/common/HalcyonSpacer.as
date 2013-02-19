package com.halcyon.layout.common
{
   import flash.display.Sprite;
   
   public class HalcyonSpacer extends Sprite
   {
      /**
       * @param width is the number that specifies the width of the component, in pixels, in the parent's coordinates.
       * @param height is the number that specifies the height of the component, in pixels, in the parent's coordinates.
       */ 
      public function HalcyonSpacer(width:Number, height:Number)
      {
         super();
         graphics.drawRect(0, 0, width, height);
      }
   }
}