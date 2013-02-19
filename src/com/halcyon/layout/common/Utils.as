package com.halcyon.layout.common
{
   public class Utils
   {
      public static var resourcesXml:XML;
      
      public static const locales:Array = [{label:"English", value:"en_US"}, {label:"Spanish", value:"es_ES"}];
      
      public static function getUSClockTime(value:Date):String 
      {
         var hrs:Number = value.getHours();
         var modifier:String = "PM";
         var minLabel:String = doubleDigitFormat(value.minutes);
         
         if(hrs > 12) 
         {
            hrs = hrs-12;
         } 
         else if(hrs == 0) 
         {
            modifier = "AM";
            hrs = 12;
         }
         else if(hrs < 12) 
         {
            modifier = "AM";
         }
         
         return doubleDigitFormat(hrs) + ":" + minLabel + " " + modifier;
      }
      
      private static function doubleDigitFormat(num:Number):String 
      {
         if(num < 10) 
         {
            return ("0" + num);
         }
         return num.toString();
      }
   }
}