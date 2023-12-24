package com.taomee.seer2.app.processor.quest.handler.main.quest110
{
   import com.taomee.seer2.app.dialog.NpcDialog;
   import com.taomee.seer2.app.processor.quest.QuestProcessor;
   import com.taomee.seer2.app.processor.quest.handler.QuestMapHandler;
   import com.taomee.seer2.app.quest.QuestManager;
   import com.taomee.seer2.core.scene.SceneManager;
   import com.taomee.seer2.core.scene.SceneType;
   
   public class QuestMapHandler_110_80561 extends QuestMapHandler
   {
       
      
      public function QuestMapHandler_110_80561(param1:QuestProcessor)
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
         var dialog0:Array = [[400,"小赛尔",[[0,"凯萨，你好。"]],["……"]],[499,"凯撒",[[0,"哟，星际使者啊。今天来这里，又要找我约架？"]],["今天不是约架。"]],[400,"小赛尔",[[0,"凯萨，听闻你曾经深入萨伦帝国的腹地，对那里的情况比较了解？"]],["……"]],[499,"凯撒",[[0,"是啊没错。怎么，星际使者有兴趣挑战一下那里的强者？"]],["虽然暂时没有这种打算，但是也与此相关。"]],[10,"巴蒂",[[0,"难道他连南半球的强者都交手过了？果真不简单！"]],["……"]],[11,"多罗",[[0,"但是南半球是个很……很凶险的地方啊。"]],["无论如何，先听下去吧。"]],[400,"小赛尔",[[0,"自从你回归北半球阵营之后，北半球的核心——能源之树的防御就更加的有力了。这期间，萨伦帝国有什么行动吗？"]],["……"]],[499,"凯撒",[[0,"能源之树是北半球的核心，也是我的责任所在……现在的我必须把曾经缺失的责任都扛回来。萨伦帝国算个什么？我能挡得住！"]],["真是豪气啊。"]],[10,"巴蒂",[[0,"以一己之力阻挡萨伦帝国的精锐铁骑，难道不是强者？ "]],["……"]],[11,"多罗",[[0,"但是，感觉很困难的样子啊……"]],["……"]],[400,"小赛尔",[[0,"那么，在那些侵略者之中，是否有些你的“故人”呢？ "]],["……"]],[499,"凯撒",[[0,"交过手而已，算哪门子故人？只是那些狰狞的新面孔，让我很感兴趣。"]],["哦？那些是谁？"]],[499,"凯撒",[[0,"似乎叫魔尊什么的，长得张牙舞爪，实力却很强劲。我们交手过几个回合，但是这群家伙要么是打打就撤，要么感觉像是故意放水。"]],["果然是这样。"]],[499,"凯撒",[[0,"（愤怒）难不成是看不起我？可恶！"]],["你先别生气。"]],[400,"小赛尔",[[0,"你刚才说他们是新面孔，你以前在萨伦帝国……没有见过他们？"]],["……"]],[499,"凯撒",[[0,"岂止是没见过，连听过都没听过！不过话说回来，如此的强者居然会一直深藏不露，真是想不明白。"]],["是啊，我们也想不明白。"]],[11,"多罗",[[0,"难……难道是从天上掉下来的？哎不对，雷伊好像也是从天上掉下来的……"]],["多罗，你这话让我灵光一现啊！"]],[10,"巴蒂",[[0,"多罗你笨啦，雷伊分明是被萨伦帝国召唤出来的！……"]],["对，就是这样！"]],[400,"小赛尔",[[0,"凯萨，既然萨伦帝国能召唤来雷伊，那么他们自然也可能召唤来一些其他的精灵不是吗？"]],["……"]],[499,"凯撒",[[0,"你的意思是，萨伦用召唤雷伊的那一套又召唤来了这些家伙？"]],["这只是目前的猜测。"]],[499,"凯撒",[[0,"总之他们来头很大对吧？这群家伙是怎么甘心被萨伦利用的？或者他们根本就不甘心吧？不然打架时怎么可能这么放水？"]],["直爽地把所有疑问都说出来了啊。"]],[11,"多罗",[[0,"那你……也不甘心被利用吧"]],["喂，多罗！"]],[499,"凯撒",[[0,"这不是废话么！我就是个追求强大力量的战士，没想到居然被那群野心家利用！"]],["所以说我警告过了……"]],[11,"多罗",[[0,"对……对不起凯萨大人！"]],["少说几句吧。"]],[10,"巴蒂",[[0,"你这样的强者，却仍旧落入了萨伦帝国的阴谋之中……"]],["……"]],[499,"凯撒",[[0,"（皱眉）萨伦帝国不容小觑，那里不仅水深，还黑。只有强者才能在那里有立锥之地！"]],["这就是我们探索过的南半球，也是我们即将探索的南半球……"]],[400,"小赛尔",[[0,"最近，我们的探索也陷入了深水区。我们发现自己失去了一些记忆，同时又被一些谜团笼罩。多谢你能给我们提供这些消息！"]],["……"]],[499,"凯撒",[[0,"谜团什么的我不在乎也不在行，不过星际使者，要是你哪天遇到了那些强者，别忘了帮我探探这些家伙的底细，我等着和他们酣畅淋漓的一战！"]],["爽快！你放心，这事我会帮你！"]],[10,"巴蒂",[[0,"不知不觉被凯萨的气概感染了。果真是强者啊。"]],["……"]],[11,"多罗",[[0,"凯萨大人果真是强者，小的服了！"]],["……"]],[499,"凯撒",[[0,"你虽然吵吵闹闹的很烦人，但是你说的没错，我不甘心被利用，从此以后也不会再被利用！如果仅仅追求力量，追求“变强”，但是却连自己的使命和本心都忘了，那样的强大一点用都没有！"]],["不过现在，你找回了自己的使命和本心。"]],[499,"凯撒",[[0,"我是火源通径的把守者，秉承着火一样炽热的意志，为北半球而战。这一切，就请星际使者和能源之树为见证！"]],["……"]],[400,"小赛尔",[[0,"不胜荣幸！ "]],["……"]],[11,"多罗",[[0,"好厉害！我……感觉整个人都燃起来了！"]],["真是难能可贵啊。"]],[10,"巴蒂",[[0,"智慧就是我的力量，队长，接下来我们该整理一下情报了吧？"]],["是的。"]],[400,"小赛尔",[[0,"接下来，我想将我们新获得的情报与云海藏书的资料进行整合。队友们，让我们向着真相，再走一步！"]],["……"]]];
         NpcDialog.showDialogs(dialog0,function():void
         {
            QuestManager.completeStep(questID,1);
            SceneManager.changeScene(SceneType.LOBBY,70);
         });
      }
   }
}