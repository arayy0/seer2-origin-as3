package MEncrypt
{
   import MEncrypt__3A__5C_alchemy_5C_cygwin_5C_tmp_5C_cc80XT98_2E_lto_2E_bc_3A_1b3fc948_2D_82a0_2D_4fee_2D_a9ab_2D_31c892a97f18.*;
   import avm2.intrinsics.memory.*;
   
   public function F_avm2_lock_id() : void
   {
      var _loc3_:* = 0;
      var _loc1_:* = 0;
      var _loc4_:* = 0;
      var _loc7_:* = 0;
      var _loc5_:* = 0;
      var _loc2_:* = ESP;
      _loc3_ = _loc2_;
      _loc2_ -= 32;
      _loc2_ -= 16;
      _loc1_ = li32(_loc3_ + 4);
      si32(_loc1_,_loc2_ + 8);
      si32(0,_loc2_ + 4);
      si32(_loc7_ = li32(_loc3_),_loc2_);
      ESP = _loc2_;
      F_avm2_cmpSwapUns();
      _loc2_ += 16;
      var _loc6_:*;
      if((_loc6_ = eax) != 0)
      {
         if((_loc6_ = li8(_sIsThreaded_2E_b)) == 1)
         {
            threadArbMutexLock();
         }
         _loc5_ = li32(_loc7_);
         do
         {
            _loc4_ = _loc5_;
            _loc2_ -= 16;
            si32(_loc4_,_loc2_ + 4);
            si32(_loc7_,_loc2_);
            si32(_loc6_ = _loc4_ | -2147483648,_loc2_ + 8);
            ESP = _loc2_;
            F_avm2_cmpSwapUns();
            _loc2_ += 16;
         }
         while((_loc5_ = eax) != _loc4_);
         
         if(_loc4_ == 0)
         {
            si32(_loc1_,_loc7_);
            ESP = _loc2_;
            F__sync_synchronize();
         }
         else
         {
            si32(1,_loc3_ - 24);
            si32(_loc7_,_loc3_ - 16);
            si32(_loc1_,_loc3_ - 12);
            si32(_loc6_ = int(threadId),_loc3_ - 8);
            si32(_loc6_ = li32(_sArbRequestHead),_loc3_ - 32);
            si32(_loc4_ = _loc3_ - 32,_sArbRequestHead);
            do
            {
               if((_loc6_ = li8(_sIsThreaded_2E_b)) == 1)
               {
                  ESP = _loc2_;
                  F__sync_synchronize();
                  _loc7_ = int(threadArbCondWait(3000));
                  ESP = _loc2_;
                  F__sync_synchronize();
               }
               _loc7_ = _sArbRequestHead;
            }
            while((_loc6_ = li32(_loc3_ - 24)) != 0);
            
            while((_loc7_ = li32(_loc5_ = _loc7_)) != 0)
            {
               if(_loc7_ == _loc4_)
               {
                  si32(_loc6_ = li32(_loc7_),_loc5_);
                  break;
               }
            }
         }
         if((_loc6_ = li8(_sIsThreaded_2E_b)) == 1)
         {
            threadArbMutexUnlock();
         }
      }
      _loc2_ = _loc3_;
      ESP = _loc2_;
   }
}