package com.taomee.seer2.core.ui.toolTip {
import com.taomee.seer2.app.popup.AlertManager;
import com.taomee.seer2.core.scene.LayerManager;
import com.taomee.seer2.core.ui.toolTip.tipSkins.BaseTipSkin;
import com.taomee.seer2.core.utils.DisplayObjectUtil;
import flash.display.DisplayObject;
import flash.display.InteractiveObject;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.setTimeout;
import flash.utils.clearTimeout;

import org.taomee.ds.HashMap;

internal class FixedToolTip extends Sprite {
// 固定提示栏，显示后位置是固定的，不会随鼠标移动而改变位置，且提示栏内部可以放置一些鼠标交互事件
// 另，该类复制自BaseTooltip，且有意准备替换一部分原本使用BaseTooltip的情况，因此方法名应向前兼容
    private var _map:HashMap;
    private var _currentTipSkin:BaseTipSkin;
    private var _currentTarget:InteractiveObject;
    private var _hideTimer:uint = 0;
    private var _placeTimer:uint = 0;

    public function FixedToolTip() {
        super();
        this._map = new HashMap();
        this._currentTarget = null;
        this._currentTipSkin = null;
    }

    public function add(param1:InteractiveObject, param2:String, param3:BaseTipSkin, param4:Function = null, param5:Function = null, param6:* = null):void {
        if (this._map.containsKey(param1)) {
            this.changeTip(param1, param2);
            return;
        }
        var ts:TipStruct = new TipStruct();
        ts.tip = param2;
        ts.tipSkin = param3;
        ts.tipSkin._parentTipStruct = ts;
        ts.over = param4;
        ts.out = param5;
        ts.content = param6;
        this._map.add(param1, ts);
        param1.addEventListener(MouseEvent.ROLL_OVER, this.onTargetOver);
        param1.addEventListener(MouseEvent.ROLL_OUT, this.onTargetOut);
        ts.tipSkin.addEventListener(MouseEvent.ROLL_OVER, this.onTargetOver);
        ts.tipSkin.addEventListener(MouseEvent.ROLL_OUT, this.onTargetOut);
    }

    public function remove(param1:InteractiveObject):void {
        var _loc2_:TipStruct = null;
        if (Boolean(this._map.containsKey(param1)) && this._map.getValue(param1) is TipStruct) {
            param1.removeEventListener(MouseEvent.ROLL_OVER, this.onTargetOver);
            param1.removeEventListener(MouseEvent.ROLL_OUT, this.onTargetOut);
            _loc2_ = this._map.getValue(param1) as TipStruct;
            _loc2_.tipSkin.hide();
            _loc2_.tipSkin.removeEventListener(MouseEvent.ROLL_OVER, this.onTargetOver);
            _loc2_.tipSkin.removeEventListener(MouseEvent.ROLL_OUT, this.onTargetOut);
            this._map.remove(param1);
        }
    }

    public function changeTip(param1:InteractiveObject, param2:String):void {
        var _loc3_:TipStruct = null;
        if (this._map.containsKey(param1)) {
            _loc3_ = this._map.getValue(param1);
            _loc3_.tip = param2;
        }
    }

    public function chanegTip(param1:InteractiveObject, param2:String):void {
        // 淘米程序员老牧师的又拼写错误，但是为了向前兼容只能这样了
        this.changeTip(param1, param2);
    }

    public function setData(param1:InteractiveObject, param2:Object):void {
        var _loc3_:TipStruct = null;
        if (this._map.containsKey(param1)) {
            _loc3_ = this._map.getValue(param1);
            _loc3_.tipSkin.setData(param2);
        }
    }

    public function addArtTips(param1:InteractiveObject, param2:DisplayObject):void {
        if (this._map.containsKey(param1)) {
            return;
        }
        param1.addEventListener(MouseEvent.ROLL_OVER, this.artTipsControl);
        param1.addEventListener(MouseEvent.ROLL_OUT, this.artTipsControl);
        this._map.add(param1, param2);
    }

    private function artTipsControl(param1:MouseEvent):void {
        var _loc2_:InteractiveObject = param1.currentTarget as InteractiveObject;
        var _loc3_:DisplayObject = this._map.getValue(_loc2_) as DisplayObject;
        if (param1.type == MouseEvent.ROLL_OVER) {
            _loc2_.addEventListener(MouseEvent.MOUSE_MOVE, this.artTipsControl);
            this.updateArtTips(_loc3_);
        } else if (param1.type == MouseEvent.ROLL_OUT) {
            _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE, this.artTipsControl);
            DisplayObjectUtil.removeFromParent(_loc3_);
        } else if (param1.type == MouseEvent.MOUSE_MOVE) {
            this.updateArtTips(_loc3_);
        }
    }

    private function updateArtTips(param1:DisplayObject):void {
        var _loc2_:Stage = LayerManager.stage;
        if (!_loc2_.contains(param1)) {
            _loc2_.addChild(param1);
        }
        if (_loc2_.mouseX > _loc2_.stageWidth - param1.width) {
            param1.x = _loc2_.mouseX - param1.width;
        } else {
            param1.x = _loc2_.mouseX;
        }
        if (_loc2_.mouseY > _loc2_.stageHeight - param1.height) {
            param1.y = _loc2_.mouseY - param1.height;
        } else {
            param1.y = _loc2_.mouseY;
        }
    }

    private function onTargetOver(param1:MouseEvent):void {
        // 该方法同时被用于监听intObject和其TipStruct的tipSkin，所以要分支处理
        var intObjectTarget:InteractiveObject = null;
        var tipSkinTarget:BaseTipSkin;
        var tipStructTarget:TipStruct = null;
        // 先判断是否是BaseTipSkin。BaseTipSkin也是继承自intObject，所以要先判断特例
        // 直接强转param1.currentTarget为BaseTipSkin，如果不是BaseTipSkin会静默失败，置null
        tipSkinTarget = param1.currentTarget as BaseTipSkin;
        if (tipSkinTarget) {
            this.clearHideTimer();
            if (this._currentTipSkin != tipSkinTarget) {
                // 发生变化，立即隐藏之前的Tip。理论上不存在悬空的Tip,但还是加点东西处理一下
                if (this._currentTarget) {
                    // 保护一下。this._currentTarget和this._currentTipSkin一定是同时存在或同时为null的，不可能存在有Tip无target的情况
                    this.hideTip(this._map.getValue(this._currentTarget) as TipStruct);
                    tipStructTarget = tipSkinTarget._parentTipStruct;
                }
                else {
                    // 如果还是当前显示的Tip，保持现状不操作
                    return;
                }
            }
        }
        else {
            // 如果不是tipSkin就视为intObject，不过当然要先检验一下
            intObjectTarget = param1.currentTarget as InteractiveObject;
            if (intObjectTarget) {
                this.clearHideTimer();
                if (this._currentTarget == intObjectTarget) {
                    // 如果_currentTarget没有变化，证明鼠标没有进入其他intObject区域，将定时器关闭，且无需更新Tip
                    return;
                }
                else {
                    // 如果变化了，先立刻将已有tip隐藏，然后再显示新的
                    if (this._currentTarget) {
                        this.hideTip(this._map.getValue(this._currentTarget) as TipStruct);
                    }
                }
                if (this._currentTarget) {
                    throw new Error("[fixedToolTip] _currentTarget should be null before show a new one");
                }
                this._currentTarget = intObjectTarget;
                tipStructTarget = this._map.getValue(intObjectTarget) as TipStruct;
            }
        }
        if (tipStructTarget) {
            this.showTip(tipStructTarget);
        }
    }

    private function onTargetOut(param1:MouseEvent):void {
        var intObjectTarget:InteractiveObject;
        var tipSkinTarget:BaseTipSkin;
        var tipStructTarget:TipStruct = null;
        tipSkinTarget = param1.currentTarget as BaseTipSkin;
        if(tipSkinTarget) {
            tipStructTarget = tipSkinTarget._parentTipStruct;
            if (tipSkinTarget != this._currentTipSkin) {
                // 理论上不应该这样，需要立刻清除所有tip
                if (this._currentTipSkin) {
                    this.hideTip(this._currentTipSkin._parentTipStruct);
                }
                this.hideTip(tipSkinTarget._parentTipStruct);
                throw new Error("fixedToolTip: TargetOutError");
            }
        }
        else {
            intObjectTarget = param1.currentTarget as InteractiveObject;
            if (intObjectTarget) {
                tipStructTarget = this._map.getValue(intObjectTarget) as TipStruct;
                if (intObjectTarget != this._currentTarget) {
                    if(this._currentTarget) {
                        this.hideTip(this._map.getValue(this._currentTarget) as TipStruct);
                    }
                    this.hideTip(this._map.getValue(intObjectTarget) as TipStruct);
                    throw new Error("fixedToolTip: TargetOutError");
                }
            }
        }
        if (tipStructTarget) {
            this.setHideTimer(tipStructTarget);
        }
    }

    private function setHideTimer(param1:TipStruct, param2:uint = 100):void {
        if (this._hideTimer > 0) {
            clearTimeout(this._hideTimer);
        }
        this._hideTimer = setTimeout(this.checkTipHide, param2, param1);
    }

    private function clearHideTimer():void {
        if (this._hideTimer > 0) {
            clearTimeout(this._hideTimer);
            this._hideTimer = 0;
        }
    }

    private function showTip(param1:TipStruct) : void {
        var _loc2_:TipStruct = param1;
        if (_loc2_) {
            if (_loc2_.tipSkin.parent) {
                return;
            } // 已经在舞台上，不重复添加到舞台上
            _loc2_.tipSkin.show(_loc2_.tip);
            if (this._currentTipSkin) {
                throw new Error("[FixedToolTip] unexpected step");
            }
            this._currentTipSkin = _loc2_.tipSkin;
            this.deployTooltip();
            if (_loc2_.over != null) {
                _loc2_.over(_loc2_.content);
            }
        }
    }

    private function hideTip(param1:TipStruct):void {
        if (!param1) {
            return;
        }
        param1.tipSkin.hide();
        if (param1.out != null) {
            param1.out();
        }
        this._currentTarget = null;
        this._currentTipSkin = null;
    }

    private function checkTipHide(param1:TipStruct):void {
        if (!this._currentTipSkin) {
            return;
        }
        if(!this._currentTarget) {
            return;
        }
        if(this._currentTipSkin != param1.tipSkin) {
            return;
        }
        var onIntObject:Boolean = this._currentTarget.hitTestPoint(LayerManager.stage.mouseX, LayerManager.stage.mouseY, true);
        var onTipStruct:Boolean = this._currentTipSkin.hitTestPoint(LayerManager.stage.mouseX, LayerManager.stage.mouseY, true);
        if (!onIntObject && !onTipStruct) {
            this.hideTip(this._map.getValue(this._currentTarget) as TipStruct);
            this.clearHideTimer();
        }
    }

    private function deployTooltip():void {
        if (!this._currentTipSkin) {
            return;
        }
        var tipSkin:BaseTipSkin = this._currentTipSkin;
        var lStage:Stage = LayerManager.stage;
        var p:Point = lStage.globalToLocal(this._currentTarget.localToGlobal(new Point(0, 0)));
        var targetRect:Rectangle = new Rectangle(p.x, p.y, this._currentTarget.width, this._currentTarget.height);
        var stageRect:Rectangle = new Rectangle(0, 0, lStage.stageWidth, lStage.stageHeight);
        //var stageRect:Rectangle = new Rectangle(0, 0, 1200, 660);
        var candidates:Array = [
            { name: "up",    rect: new Rectangle(targetRect.x + (targetRect.width - tipSkin.width) / 2, targetRect.y - tipSkin.height,                           tipSkin.width, tipSkin.height) },
            { name: "down",  rect: new Rectangle(targetRect.x + (targetRect.width - tipSkin.width) / 2, targetRect.y + targetRect.height,                        tipSkin.width, tipSkin.height) },
            { name: "left",  rect: new Rectangle(targetRect.x - tipSkin.width,                          targetRect.y + (targetRect.height - tipSkin.height) / 2, tipSkin.width, tipSkin.height) },
            { name: "right", rect: new Rectangle(targetRect.x + targetRect.width,                       targetRect.y + (targetRect.height - tipSkin.height) / 2, tipSkin.width, tipSkin.height) }
        ];
        var bestRect:Rectangle = null;
        var bestArea:Number = -1;
        for each (var c:Object in candidates) {
            var inter:Rectangle = c.rect.intersection(stageRect);
            var area:Number = (inter.width > 0 && inter.height > 0) ? inter.width * inter.height : 0;
            if (area > bestArea) {
                bestArea = area;
                bestRect = c.rect;
            }
        }
        //tipSkin.x = bestRect.x;
        //tipSkin.y = bestRect.y;
        tipSkin.x = p.x;
        tipSkin.y = p.y - tipSkin.height;
        if (this._placeTimer > 0) {
            clearTimeout(this._placeTimer);
            this._placeTimer = 0;
        }
    }
}
}
