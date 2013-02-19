package com.halcyon.layout.common
{
   import com.soma.ui.layouts.HBoxUI;
   import com.soma.ui.vo.GapUI;
   import com.soma.ui.vo.PaddingUI;
   
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   
   public class HalcyonHGroup extends HBoxUI
   {
      private var _gapUI:GapUI;
      private var _paddingUI:PaddingUI;
      
      public function HalcyonHGroup(reference:DisplayObjectContainer, width:Number = 15, height:Number = 15)
      {
         super(reference, width, height);
         _gapUI = new GapUI();
         _paddingUI = new PaddingUI();
      }
      
      /**
       * @param value specifies the number of pixels between children in the vertical direction.
       */ 
      public function set verticalGap(value:Number):void 
      {
         _gapUI.vertical = value;
         childrenGap = _gapUI;
         refresh();
      }
      
      /**
       * @param value specifies the number of pixels between children in the horizontal direction.
       */ 
      public function set horizontalgap(value:Number):void 
      {
         _gapUI.horizontal = value;
         childrenGap = _gapUI;
         refresh();
      }
      
      /**
       * @param value specifies the number of pixels between the component's left border and the left edge of its content area.
       */ 
      public function set paddingLeft(value:Number):void 
      {
         _paddingUI.left = value;
         childrenPadding = _paddingUI;
         refresh();
      }
      
      /**
       * @param value specifies the number of pixels between the component's right border and the right edge of its content area.
       */ 
      public function set paddingRight(value:Number):void 
      {
         _paddingUI.right = value;
         childrenPadding = _paddingUI;
         refresh();
      }
      
      /**
       * @param value specifies the number of pixels between the container's top border and the top of its content area.
       */ 
      public function set paddingTop(value:Number):void 
      {
         _paddingUI.top = value;
         childrenPadding = _paddingUI;
         refresh();
      }
      
      /**
       * @param value specifies the number of pixels between the container's bottom border and the bottom of its content area.
       */ 
      public function set paddingBottom(value:Number):void 
      {
         _paddingUI.bottom = value;
         childrenPadding = _paddingUI;
         refresh();
      }
      
      /**
       * @param child is the DisplayObject to add as a child of this Container.
       */ 
      override public function addChild(child:DisplayObject):DisplayObject 
      {
         var displayObject:DisplayObject = super.addChild(child);
         refresh();
         return displayObject;
      }
   }
}