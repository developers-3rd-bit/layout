package com.halcyon.layout.common
{
   import com.soma.ui.ElementUI;
   import com.soma.ui.layouts.CanvasUI;
   
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   
   public class HalcyonCanvas extends CanvasUI
   {
      public function HalcyonCanvas(reference:DisplayObjectContainer, width:Number = 15, height:Number = 15)
      {
         super(reference, width, height);
      }
      
      /**
       * @param displayObject DisplayObject component
       * @param argTop The vertical distance, in pixels, from the top edge of the component to the top edge of its parent container's content area.
       * @param argBottom The vertical distance, in pixels, from the bottom edge of the component to the bottom edge of its parent container's content area.
       * @param argLeft The horizontal distance, in pixels, from the left edge of the component to the left edge of its parent container's content area.
       * @param argRight The horizontal distance, in pixels, from the right edge of the component to the right edge of its parent container's content area. 
       */ 
      public function prepareElementAndPosition(displayObject:DisplayObject, argTop:Number = NaN, argBottom:Number = NaN, 
                                                argLeft:Number = NaN, argRight:Number = NaN):DisplayObject 
      {
         if (displayObject == null) return null;
         var elementUI:ElementUI = this.add(displayObject);
         elementUI.top = argTop;
         elementUI.bottom = argBottom;
         elementUI.left = argLeft;
         elementUI.right = argRight;
         elementUI.refresh();
         return this.element.object;
      }
   }
}