package com.halcyon.layout.common
{
   import com.soma.ui.layouts.VBoxUI;
   import com.soma.ui.vo.GapUI;
   import com.soma.ui.vo.PaddingUI;
   
   import fl.containers.ScrollPane;
   import fl.controls.ScrollBar;
   import fl.controls.ScrollPolicy;
   
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class HalcyonScrollableVGroup extends Sprite
   {
      private var _scrollPane:ScrollPane;
      private var _vGroup:VBoxUI;
      private var _gapUI:GapUI;
      private var _paddingUI:PaddingUI;
      private var _initialHeight:Number;
      private var _currentHeight:Number;
      private var _refreshOnChildAddRemove:Boolean;
      
      public function HalcyonScrollableVGroup(width:Number = 15, height:Number = 15, argRefreshOnChildAddRemove:Boolean = true)
      {
         super();
         _vGroup = new VBoxUI(this, width, height);
         _refreshOnChildAddRemove = argRefreshOnChildAddRemove;
         _gapUI = new GapUI();
         _paddingUI = new PaddingUI();
         _initialHeight = height;
         _currentHeight = 0;
         _scrollPane = new ScrollPane();
         _scrollPane.width = width;
         _scrollPane.height = height;
         _scrollPane.verticalScrollPolicy = ScrollPolicy.ON;
         _scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         _scrollPane.source = _vGroup;
         super.addChild(_scrollPane);
      }
      
      public function get verticalScrollPolicy():String 
      {
         return _scrollPane.verticalScrollPolicy;
      }
      
      /**
       * @param value specifies whether the vertical scroll bar is always present, always absent, or automatically added when needed.
       */ 
      public function set verticalScrollPolicy(value:String):void 
      {
         _scrollPane.verticalScrollPolicy = value;
      }
      
      public function get horizontalScrollPolicy():String 
      {
         return _scrollPane.horizontalScrollPolicy;
      }
      
      /**
       * @param value specifies whether the horizontal scroll bar is always present, always absent, or automatically added when needed.
       */ 
      public function set horizontalScrollPolicy(value:String):void 
      {
         _scrollPane.horizontalScrollPolicy = value;
      }
      
      public function get verticalScrollBar():ScrollBar 
      {
         return _scrollPane.verticalScrollBar;
      }
      
      public function get horizontalScrollBar():ScrollBar 
      {
         return _scrollPane.horizontalScrollBar;
      }
      
      public function get horizontalLineScrollSize():Number 
      {
         return _scrollPane.horizontalLineScrollSize;
      }
      
      /**
       * @param value specifies number of pixels to move when the left- or right-arrow button in the horizontal scroll bar is pressed.
       */
      public function set horizontalLineScrollSize(value:Number):void 
      {
         _scrollPane.horizontalLineScrollSize = value;
      }
      
      public function get verticalLineScrollSize():Number 
      {
         return _scrollPane.verticalLineScrollSize;
      }
      
      /**
       * @param value specifies number of pixels to scroll when the up- or down-arrow button in the vertical scroll bar is pressed, or when you scroll by using the mouse wheel.
       */
      public function set verticalLineScrollSize(value:Number):void 
      {
         _scrollPane.verticalLineScrollSize = value;
      }
      
      public function get verticalPageScrollSize():Number 
      {
         return _scrollPane.verticalPageScrollSize;
      }
      
      /**
       * @param value specifies number of pixels to scroll when the track in the vertical scroll bar is pressed.
       */
      public function set verticalPageScrollSize(value:Number):void 
      {
         _scrollPane.verticalPageScrollSize = value;
      }
      
      public function get horizontalPageScrollSize():Number 
      {
         return _scrollPane.horizontalPageScrollSize;
      }
      
      /**
       * @param value specifies number of pixels to move when the track in the horizontal scroll bar is pressed.
       */
      public function set horizontalPageScrollSize(value:Number):void 
      {
         _scrollPane.horizontalPageScrollSize = value;
      }
      
      override public function get numChildren():int 
      {
         return _vGroup.numChildren;
      }
      
      /**
       * @param child is the DisplayObject to add as a child of this Container.
       */ 
      override public function addChild(child:DisplayObject):DisplayObject 
      {
         var displayObject:DisplayObject = _vGroup.addChild(child);
         _currentHeight += displayObject.height + verticalGap;
         if (_currentHeight >= _initialHeight)
         {
            _vGroup.height = _currentHeight;
         }
         if(_refreshOnChildAddRemove) refresh();
         return displayObject;
      }
      
      /**
       * @param child is the DisplayObject to add as a child of this Container.
       * @param index is the index to add the child at.
       */
      override public function addChildAt(child:DisplayObject, index:int):DisplayObject 
      {
         var displayObject:DisplayObject = _vGroup.addChildAt(child, index);
         _currentHeight += displayObject.height + verticalGap;
         if(_currentHeight >= _initialHeight)
            _vGroup.height = _currentHeight;
         if(_refreshOnChildAddRemove) refresh();
         return displayObject;
      }
      
      /**
       * @param child is The DisplayObject to remove.
       */ 
      override public function removeChild(child:DisplayObject):DisplayObject 
      {
         var displayObject:DisplayObject = _vGroup.removeChild(child);
         _currentHeight -= displayObject.height + verticalGap;
         if(_currentHeight < _initialHeight) 
            _vGroup.height = _initialHeight;
         else
            _vGroup.height = _currentHeight;
         if(_refreshOnChildAddRemove) refresh();
         return displayObject;
      }
      
      /**
       * @param index is the child index of the DisplayObject to remove.
       */
      override public function removeChildAt(index:int):DisplayObject 
      {
         var displayObject:DisplayObject = _vGroup.removeChildAt(index);
         _currentHeight -= displayObject.height + verticalGap;
         if (_currentHeight < _initialHeight)
         {
            _vGroup.height = _initialHeight;
         }
         else
         {
            _vGroup.height = _currentHeight;
         }
         if(_refreshOnChildAddRemove) refresh();
         return displayObject;
      }
      
      /**
       * @param beginIndex is the beginning position. A value smaller than 0 throws a RangeError.
       * @param endIndex is the ending position. A value smaller than 0 throws a RangeError.
       */
      override public function removeChildren(beginIndex:int=0, endIndex:int=int.MAX_VALUE):void 
      {
         _vGroup.removeChildren(beginIndex, endIndex);
         _currentHeight = 0;
         _vGroup.height = _initialHeight;
         if(_refreshOnChildAddRemove) refresh();
      }
      
      /**
       * @param index is the Number from 0 to (numChildren - 1).
       */
      override public function getChildAt(index:int):DisplayObject 
      {
         return _vGroup.getChildAt(index);
      }
      
      /**
       * @param name is the identifier of the child.
       */
      override public function getChildByName(name:String):DisplayObject 
      {
         return _vGroup.getChildByName(name);
      }
      
      /**
       * @param child is the reference to child whose index to get.
       */
      override public function getChildIndex(child:DisplayObject):int 
      {
         return _vGroup.getChildIndex(child);
      }
      
      public function refresh():void 
      {
         _vGroup.refresh();
         _scrollPane.update();
         _scrollPane.refreshPane();
      }
      
      public function get verticalGap():Number 
      {
         return _gapUI.vertical;
      }
      
      /**
       * @param value is the alignment of children in the container.  The following are valid values:
       * <br>VBoxUI.ALIGN_BOTTOM_CENTER
       * <br>VBoxUI.ALIGN_BOTTOM_LEFT
       * <br>VBoxUI.ALIGN_BOTTOM_RIGHT
       * <br>VBoxUI.ALIGN_TOP_CENTER
       * <br>VBoxUI.ALIGN_TOP_LEFT
       * <br>VBoxUI.ALIGN_TOP_RIGHT
       */
      public function set childrenAlign(value:String):void 
      {
         _vGroup.childrenAlign = value;
         _vGroup.refresh();
      }
      
      /**
       * @param value specifies the number of pixels between children in the vertical direction.
       */ 
      public function set verticalGap(value:Number):void 
      {
         _gapUI.vertical = value;
         _vGroup.childrenGap = _gapUI;
         _vGroup.refresh();
      }
      
      /**
       * @param value specifies the number of pixels between children in the horizontal direction.
       */ 
      public function set horizontalgap(value:Number):void 
      {
         _gapUI.horizontal = value;
         _vGroup.childrenGap = _gapUI;
         _vGroup.refresh();
      }
      
      /**
       * @param value specifies the number of pixels between the component's left border and the left edge of its content area.
       */ 
      public function set paddingLeft(value:Number):void 
      {
         _paddingUI.left = value;
         _vGroup.childrenPadding = _paddingUI;
         _vGroup.refresh();
      }
      
      /**
       * @param value specifies the number of pixels between the component's right border and the right edge of its content area.
       */ 
      public function set paddingRight(value:Number):void 
      {
         _paddingUI.right = value;
         _vGroup.childrenPadding = _paddingUI;
         _vGroup.refresh();
      }
      
      /**
       * @param value specifies the number of pixels between the container's top border and the top of its content area.
       */ 
      public function set paddingTop(value:Number):void 
      {
         _paddingUI.top = value;
         _vGroup.childrenPadding = _paddingUI;
         _vGroup.refresh();
      }
      
      /**
       * @param value specifies the number of pixels between the container's bottom border and the bottom of its content area.
       */ 
      public function set paddingBottom(value:Number):void 
      {
         _paddingUI.bottom = value;
         _vGroup.childrenPadding = _paddingUI;
         _vGroup.refresh();
      }
      
      /**
       * @param value The vertical distance, in pixels, from the top edge of the component to the top edge of its parent container's content area.
       */ 
      public function set top(value:Number):void 
      {
         _vGroup.top = value;
      }
      
      /**
       * @param value The vertical distance, in pixels, from the bottom edge of the component to the bottom edge of its parent container's content area.
       */ 
      public function set bottom(value:Number):void 
      {
         _vGroup.bottom = value;   
      }
      
      /**
       * @param value The horizontal distance, in pixels, from the left edge of the component to the left edge of its parent container's content area.
       */ 
      public function set left(value:Number):void 
      {
         _vGroup.left = value;
      }
      
      /**
       * @param value The horizontal distance, in pixels, from the right edge of the component to the right edge of its parent container's content area. 
       */ 
      public function set right(value:Number):void 
      {
         _vGroup.right = value;  
      }
      
      /**
       * @param vGroupElement is the DisplayObject to remove.
       */ 
      public function deleteElement(vGroupElement:VGroupElement):void 
      {
         for(var i:int=0;i<_vGroup.numChildren;i++) 
         {
            var userContactEntry:VGroupElement = _vGroup.getChildAt(i) as VGroupElement;
            if(userContactEntry.elementId != vGroupElement.elementId) continue;
            _currentHeight -= _vGroup.getChildAt(i).height;
            if (_currentHeight < _initialHeight)
            {
               _vGroup.height = _initialHeight;
            }
            else
            {
               _vGroup.height = _currentHeight;
            }
            _vGroup.removeChildAt(i);
            if(_refreshOnChildAddRemove) refresh();
            break;
         }
      }
      
      public function refreshPane():void {
         _scrollPane.refreshPane();
      }
      
      public function update():void {
         _scrollPane.update();
      }
   }
}