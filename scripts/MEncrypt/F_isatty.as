package MEncrypt
{
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   
   public function F_isatty() : void
   {
      var _loc3_:* = 0;
      var _loc1_:* = 0;
      var _loc4_:int = 0;
      var _loc2_:* = ESP;
      _loc3_ = _loc2_;
      _loc2_ -= 48;
      _loc2_ -= 16;
      _loc1_ = _loc3_ - 48;
      si32(_loc1_,_loc2_ + 8);
      si32(1076655123,_loc2_ + 4);
      _loc1_ = li32(_loc3_);
      si32(_loc1_,_loc2_);
      ESP = _loc2_;
      F__ioctl();
      _loc4_ = 1;
      _loc2_ += 16;
      _loc1_ = eax;
      if(_loc1_ == -1)
      {
         _loc4_ = 0;
      }
      _loc1_ = _loc4_ & 1;
      eax = _loc1_;
      _loc2_ = _loc3_;
      ESP = _loc2_;
   }
}