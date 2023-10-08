package com.adobe.protocols.dict.events
{
   import flash.events.Event;
   
   public class ConnectedEvent extends Event
   {
      
      public static const CONNECTED:String = "connected";
       
      
      public function ConnectedEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new ConnectedEvent(type,bubbles,cancelable);
      }
   }
}