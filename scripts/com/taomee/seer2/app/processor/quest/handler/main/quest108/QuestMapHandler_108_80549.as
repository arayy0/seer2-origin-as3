package com.taomee.seer2.app.processor.quest.handler.main.quest108
{
   import com.taomee.seer2.app.dialog.NpcDialog;
   import com.taomee.seer2.app.processor.quest.QuestProcessor;
   import com.taomee.seer2.app.processor.quest.handler.QuestMapHandler;
   import com.taomee.seer2.app.quest.QuestManager;
   import com.taomee.seer2.app.utils.MovieClipUtil;
   import com.taomee.seer2.core.scene.SceneManager;
   import com.taomee.seer2.core.scene.SceneType;
   import flash.display.MovieClip;
   
   public class QuestMapHandler_108_80549 extends QuestMapHandler
   {
       
      
      private var _sceneMv:MovieClip;
      
      public function QuestMapHandler_108_80549(param1:QuestProcessor)
      {
         super(param1);
      }
      
      override public function processMapComplete() : void
      {
         if(!QuestManager.isAccepted(_quest.id))
         {
            return;
         }
         if(QuestManager.isComplete(_quest.id))
         {
            return;
         }
         if(QuestManager.isStepComplete(_quest.id,1) == false)
         {
            this.initStep1();
         }
      }
      
      private function initStep1() : void
      {
         var dialog0:Array;
         var mv:MovieClip = null;
         var dialog1:Array = null;
         var dialog2:Array = null;
         mv = _processor.resLib.getMovieClip("sceneMv");
         this._sceneMv = mv;
         mv.gotoAndStop(1);
         SceneManager.active.mapModel.front.addChild(mv);
         mv.x = mv.y = 0;
         dialog0 = [[10,"巴蒂",[[0,"真是辽阔宏大的场面啊，站在高山之巅的王者，万里江山尽收眼底……"]],["是啊，登高极目，俯瞰众生"]],[11,"多罗",[[0,"（抬头）嘿！男神在那里！（大喊）男神！男神！"]],["……我觉得你还是换个称呼为好"]],[400,"小赛尔",[[0,"尊敬的精灵王约瑟！星际使者今日叨扰了！"]],["……"]]];
         dialog1 = [[814,"约瑟王",[[0,"（微笑）啊，是星际使者。今日拜访，不知有何贵干？"]],["……"]],[400,"小赛尔",[[0,"尊敬的约瑟王，我们冒昧前来拜访，想请问您接下来的作战安排。"]],["……"]],[10,"巴蒂",[[0,"（小声）队长，你这是闹哪样啊？"]],["接下来你就知道了。"]],[814,"约瑟王",[[0,"星际使者，有什么话不要藏着掖着嘛，直言极谏什么的都没问题的！"]],["真是大度啊。"]],[400,"小赛尔",[[0,"现在战况可谓是焦灼了，对于南半球方面的奎尔斯之影和魔尊，您有什么计划？"]],["……"]],[10,"巴蒂",[[0,"（直接开启了无线电通讯）队长，我认为你这旁敲侧击的有点过了，这样的话我们什么时候才能问到有用的东西啊？"]],["（无线电回话）放心好了，我会按部就班地引入话题的！"]],[814,"约瑟王",[[0,"奎尔斯之影虽然强大，但是和我还有一些差距，至于魔尊……着实头疼，不知道他的实力究竟怎么样。也许是我没有看出来，也许是深不可测……"]],["对于【精灵王约瑟】而言深不可测？"]],[400,"小赛尔",[[0,"据说是萨伦找来的救兵，但是对于这只精灵的来路，还是很不明确啊"]],["……"]],[11,"多罗",[[0,"主公分明是最棒的！世界上哪有什么主公解决不了货色？！"]],["多罗突然暴走了？！"]],[814,"约瑟王",[[0,"哈哈，这位仁兄真是过奖了。我毕竟还是难以解决奎尔斯的。"]],["……"]],[11,"多罗",[[0,"主公我相信你可以的！魔尊那是哪路货色？主公秒天秒地秒空气！"]],["多罗这是被吓短路了？"]],[400,"小赛尔",[[0,"您自从重临世界以来，就一直组织着北半球抵御南半球铁蹄的入侵。我们作为北半球的盟友，想为您尽一些微薄之力。"]],["……"]],[400,"小赛尔",[[0,"母船拥有众多的精灵资料，甚至那些以传说形式留存下来的只言片语也被记录。但是凭着这些，我们还是没能找到魔尊之流的来路。现在北半球面临他们的挑战，与他们在战场上有过交手的您，想必知道的比我们多。"]],["……"]],[814,"约瑟王",[[0,"（似乎有些忧虑）魔尊实力不俗，当初我拼尽全力与他对抗……之后我还和他们交过几次手，但是他们似乎无心恋战，没有使出全力。"]],["看来关键已经出现了，接下来就点透这个谜吧！"]],[10,"巴蒂",[[0,"那岂不是危险？您用尽了全力才能抵抗萨伦帝国的这些走狗，那么，阿卡迪亚恐怕是危在旦夕啊！"]],["对，就等你这句话了！"]],[400,"小赛尔",[[0,"尊敬的约瑟王，五千年前您和南半球之王奎尔斯的决战撕裂了阿卡迪亚。而在我们所经历过的那场会战之中，已经【用尽全力】和萨伦的走狗对抗的您，却没有让阿卡迪亚整体的安危受到损害。看来您对力量的控制更加精进了。"]],["……"]],[814,"约瑟王",[[0,"多谢星际使者夸奖，然而我认为你的话是非常复杂的外交辞令……有些事情，作为盟友，我们应该互相分享，有效的合作，但是作为王，我不能说。"]],["您的意思是？"]],[11,"多罗",[[0,"没事的主公！我等必将倾力相助，庶什么什么钝……"]],["庶诘驽钝……"]],[10,"巴蒂",[[0,"请您无视这个难得说点有意义的话还不知道字怎么读的家伙。"]],["巴蒂还是这么尖锐啊。"]],[814,"约瑟王",[[0,"（叹息）既然你们已经这样说了，我就不再隐瞒了。我能感觉到，自己现在的实力和当年撕裂星球的力量相比相差太远……"]],["……"]],[814,"约瑟王",[[0,"我本以为这是因为苏醒之后的自己力量还未恢复，但是没想到就算获得了更高级的形态，我的力量还是不够。"]],["……"]],[400,"小赛尔",[[0,"我们了解您的困惑，正因如此，我们不会把这件事说出去。"]],["……"]],[400,"小赛尔",[[0,"您能够一个人承担迷惘并自己寻求突破，您一直作为北半球的支柱抵抗着萨伦帝国的侵略，您鼓励着北半球的族人们，让他们鼓起勇气，拿起武器，为自己的未来而战，这样的王值得尊敬！"]],["……"]],[814,"约瑟王",[[0,"谢谢你，星际使者。"]],["……"]],[10,"巴蒂",[[0,"等等，还有一个问题。您当年率领北半球和以奎尔斯为首的南半球势力决战，那个时候南半球的强者已经倾巢而出了吧？您难道对魔尊这种令人印象深刻的家伙没有印象？"]],["天哪，巴蒂真是一点就通，迅速找到了矛盾所在。"]],[814,"约瑟王",[[0,"（莫名的沉默）……"]],["您想到什么了"]],[814,"约瑟王",[[0,"是的……准确的说，我能想起来的，当年的事，不多。"]],["如此沉重而艰难的语气，看来这一切确实有问题"]],[11,"多罗",[[0,"这也就是说，主公您忘了那个啥啥白驹，食我场苗的誓言"]],["多罗你在说什么？皎皎白驹？"]],[814,"约瑟王",[[0,"对不起，我真的不知道你在说什么。"]],["……"]],[11,"多罗",[[0,"可恶！翼灵女神和那个前辈明明说云海藏书的东西都是真的！你现在却说不记得！你一定有问题！说！你是不是真正的主公！"]],["多罗你没事吧？！"]],[10,"巴蒂",[[0,"多罗你怎么回事？彻底坏掉了吗？！我就说自从那天你看完云海藏书的东西之后就特别不正常！"]],["……"]],[814,"约瑟王",[[0,"疑惑）我……我是精灵王约瑟，但是，我确实不知道你在说什么。"]],["……"]]];
         dialog2 = [[307,"翼灵兽",[[0,"吾辈就知道会这样。"]],["翼灵兽！"]],[10,"巴蒂",[[0,"翼灵兽您终于来了，您知道这个已经神经错乱的家伙是怎么回事吗？"]],["“一本粉红的罗曼史”？"]],[814,"约瑟王",[[0,"（有些惊讶）你……翼灵兽？你知道他们刚才在说什么？"]],["王和灵兽的见面，这个历史性的画面伴随的却是谜团。"]],[307,"翼灵兽",[[0,"皎皎白驹，食我场苗。絷之维之，以永今朝。吾辈已经将所有属于你的东西还给你了，就算如此，你还是不记得么？"]],["好微妙的话……不过翼灵兽难道不对王使用敬称？"]],[814,"约瑟王",[[0,"是的，你确实归还了属于我的东西，让我重临世界。但是我确实不记得……我不记得当年的敌人究竟有哪些，不记得你们所说的什么誓言，我不记得很多事情，甚至连力量都是残缺的，这样的我……"]],["感觉，有些心酸啊"]],[814,"约瑟王",[[0,"但是，只要我还保留着【精灵王约瑟】的身份，我就必须承担起所有的责任，我会为了保护北半球而拼尽全力去战斗。"]],["……"]],[307,"翼灵兽",[[0,"（苦笑）还是那么逞强啊。虽然力量和记忆都残缺着……但是你确实与【精灵王约瑟】之名相配，只不过，你不是他。"]],["“你不是他”？"]],[400,"小赛尔",[[0,"（思考）“他”是指翼灵兽所认识的约瑟么？不对，她是灵兽啊，为什么会是一副和约瑟旧相识的样子？"]],["……"]],[814,"约瑟王",[[0,"虽然不太明白你说的具体是什么，但是，我会一直在自己应该在的位置上战斗！"]],["……"]],[307,"翼灵兽",[[0,"哪怕仅仅以现在的实力就可以撑起局面，但是从你的样子来看，你完全是在逞强。分明有着这样的疑虑和残缺，却一声不吭，只是用使命撑着自己走下去……这样的你，和吾辈记忆之中的，相差太多。"]],["这么说，翼灵和约瑟真的是旧相识？这是怎么回事？"]],[814,"约瑟王",[[0,"我……"]],["……"]],[307,"翼灵兽",[[0,"虽然在大众面前永远带着如希望般明亮的微笑，但是那时的约瑟，总能够找到能为他分忧的人们，和他们一起坦然面对困苦和磨难。他从未迷茫。但是你……"]],["他是这样的精灵王么？"]],[11,"多罗",[[0,"女神和男神就这么散了……散了……"]],["原来女神和男神是他们啊？"]],[307,"翼灵兽",[[0,"多罗，你别伤心。这么多年，吾辈也仁至义尽了，千年来，吾辈只希望约瑟能承担起北半球甚至阿卡迪亚的希望，无论这个约瑟是怎样的……除此之外，别无所求。"]],["……"]],[814,"约瑟王",[[0,"翼灵兽，星际使者，就算我的记忆与力量是残缺的，但是我从未，从未放弃过希望！我会一直战斗，让自己配得上这个世界的希望。"]],["我们都在为希望而奋斗着啊"]],[814,"约瑟王",[[0,"星际使者，接下来我还要投入对萨伦的走狗的战斗。我想，曾经前往南半球并与萨伦帝国合作过的凯萨，以及被萨伦帝国错误召唤而来并一直与其势力对抗的雷伊会知道一些事情。你们不妨去找找他们吧。"]],["确实是个好主意"]],[814,"约瑟王",[[0,"（望向翼灵）也许在未来，会有你再见到那个【约瑟】的时候……"]],["……"]]];
         NpcDialog.showDialogs(dialog0,function():void
         {
            mv.gotoAndStop(2);
            MovieClipUtil.playMc(mv["mv"],2,mv["mv"].totalFrames,function():void
            {
               NpcDialog.showDialogs(dialog1,function():void
               {
                  mv.gotoAndStop(3);
                  MovieClipUtil.playMc(mv["mv"],3,mv["mv"].totalFrames,function():void
                  {
                     NpcDialog.showDialogs(dialog2,function():void
                     {
                        _sceneMv.visible = false;
                        _sceneMv = null;
                        QuestManager.completeStep(questID,1);
                        SceneManager.changeScene(SceneType.LOBBY,70);
                     });
                  });
               });
            });
         });
      }
   }
}