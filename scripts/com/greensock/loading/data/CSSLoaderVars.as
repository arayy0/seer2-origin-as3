package com.greensock.loading.data
{
   import flash.display.DisplayObject;
   
   public class CSSLoaderVars
   {
      
      public static const version:Number = 1.2;
       
      
      protected var _vars:Object;
      
      public function CSSLoaderVars(param1:Object = null)
      {
         var _loc2_:String = null;
         super();
         _vars = {};
         if(param1 != null)
         {
            for(_loc2_ in param1)
            {
               _vars[_loc2_] = param1[_loc2_];
            }
         }
      }
      
      public function onHTTPStatus(param1:Function) : CSSLoaderVars
      {
         return _set("onHTTPStatus",param1);
      }
      
      public function onOpen(param1:Function) : CSSLoaderVars
      {
         return _set("onOpen",param1);
      }
      
      public function get isGSVars() : Boolean
      {
         return true;
      }
      
      protected function _set(param1:String, param2:*) : CSSLoaderVars
      {
         if(param2 == null)
         {
            delete _vars[param1];
         }
         else
         {
            _vars[param1] = param2;
         }
         return this;
      }
      
      public function allowMalformedURL(param1:Boolean) : CSSLoaderVars
      {
         return _set("allowMalformedURL",param1);
      }
      
      public function noCache(param1:Boolean) : CSSLoaderVars
      {
         return _set("noCache",param1);
      }
      
      public function onError(param1:Function) : CSSLoaderVars
      {
         return _set("onError",param1);
      }
      
      public function prop(param1:String, param2:*) : CSSLoaderVars
      {
         return _set(param1,param2);
      }
      
      public function onProgress(param1:Function) : CSSLoaderVars
      {
         return _set("onProgress",param1);
      }
      
      public function requireWithRoot(param1:DisplayObject) : CSSLoaderVars
      {
         return _set("requireWithRoot",param1);
      }
      
      public function get vars() : Object
      {
         return _vars;
      }
      
      public function estimatedBytes(param1:uint) : CSSLoaderVars
      {
         return _set("estimatedBytes",param1);
      }
      
      public function autoDispose(param1:Boolean) : CSSLoaderVars
      {
         return _set("autoDispose",param1);
      }
      
      public function name(param1:String) : CSSLoaderVars
      {
         return _set("name",param1);
      }
      
      public function alternateURL(param1:String) : CSSLoaderVars
      {
         return _set("alternateURL",param1);
      }
      
      public function onComplete(param1:Function) : CSSLoaderVars
      {
         return _set("onComplete",param1);
      }
      
      public function onCancel(param1:Function) : CSSLoaderVars
      {
         return _set("onCancel",param1);
      }
      
      public function onIOError(param1:Function) : CSSLoaderVars
      {
         return _set("onIOError",param1);
      }
      
      public function onFail(param1:Function) : CSSLoaderVars
      {
         return _set("onFail",param1);
      }
   }
}