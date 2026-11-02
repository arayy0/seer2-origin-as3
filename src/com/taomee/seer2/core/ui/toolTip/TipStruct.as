package com.taomee.seer2.core.ui.toolTip {
import com.taomee.seer2.core.ui.toolTip.tipSkins.BaseTipSkin;

public class TipStruct {

    public var tip:String;

    public var tipSkin:BaseTipSkin;

    public var over:Function;

    public var out:Function;

    public var content:*;

    public function TipStruct() {
        super();
    }
}
}