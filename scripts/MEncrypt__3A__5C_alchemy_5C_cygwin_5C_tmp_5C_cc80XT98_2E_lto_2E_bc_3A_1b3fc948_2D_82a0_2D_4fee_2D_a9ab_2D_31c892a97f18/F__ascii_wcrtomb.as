package MEncrypt__3A__5C_alchemy_5C_cygwin_5C_tmp_5C_cc80XT98_2E_lto_2E_bc_3A_1b3fc948_2D_82a0_2D_4fee_2D_a9ab_2D_31c892a97f18
{
   import MEncrypt.ESP;
   import MEncrypt.F___error;
   import MEncrypt.eax;
   import avm2.intrinsics.memory.li32;
   import avm2.intrinsics.memory.si32;
   import avm2.intrinsics.memory.si8;
   
   public function F__ascii_wcrtomb() : void
   {
      var _loc3_:* = 0;
      var _loc5_:* = 0;
      var _loc1_:* = 0;
      var _loc2_:* = ESP;
      _loc3_ = _loc2_;
      _loc1_ = 1;
      if((_loc5_ = li32(_loc3_)) != 0)
      {
         _loc1_ = li32(_loc3_ + 4);
         if(uint(_loc1_) >= 128)
         {
            ESP = _loc2_;
            F___error();
            si32(86,eax);
            _loc1_ = -1;
         }
         else
         {
            si8(_loc1_,_loc5_);
            _loc1_ = 1;
         }
      }
      eax = _loc1_;
      _loc2_ = _loc3_;
      ESP = _loc2_;
   }
}