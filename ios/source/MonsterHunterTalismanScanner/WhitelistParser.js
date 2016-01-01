//http://mhapi.info/translate/skilltrees-en.html
var fullCharacterSet = []
var listItems = document.querySelectorAll(".pure-g.poogie-li");
var listItemLength = jpNodes.length;
for(var i = 0; i < listItemLength; i++) {
    var current = listItems[i];
    if (current && current.children && current.children.length > 1) {
        var jpNode = current.children[1];
        fullCharacterSet.push(jpNode.innerText);
    }
}
var fullCharacterString = fullCharacterSet.join("")
console.log(fullCharacterString.replace(/[^\w\s]|(.)(?=\1)/gi, ""))

/*
 弾薬節約盗み無効砲術攻撃ベルナ細菌学黒炎王爆破瓶追加裂傷属性耐性鈍器爆弾強化泡沫接撃瓶追加肉食剥ぎ取りチャンス護石王拡散弾追加耐寒寒冷適応調合数調合成功率連撃体術榴弾追加紅兜抜刀会心属性会心特殊会心会心強化だるま射法対防御DOWN防御重撃龍属性攻撃龍耐性食事属性攻撃属強瓶追加回避距離回避性能減気瓶追加達人溜め短縮運気剣術火属性攻撃火耐性狂撃耐性採取本気食いしん坊金雷公ガード性能ガード強化根性匠体力聴覚保護耐暑炎熱適応大雪主重撃弾強化野草知識英雄の盾ハチミツ腹減り氷属性攻撃氷耐性燼滅刃変則射撃KOココット効果持続跳躍節食装填数無心笛乗り茸食通常弾追加通常弾強化隻眼麻痺瓶追加麻痺散弾追加散弾強化観察眼貫通弾追加貫通弾強化毒毒瓶追加ポッケ研磨術底力強撃瓶追加精密射撃加護千里眼抜刀減気狩人速射逆上回復量回復速度反動装填速度岩穿荒鉤爪気配研ぎ師斬れ味納刀睡眠睡眠瓶追加矛砕高速設置闘魂減気攻撃気力回復スタミナ特殊攻撃気絶逆境号令采配痛撃雷属性攻撃雷耐性窮地捕獲運搬宝纏耐震無傷紫毒姫水属性攻撃水耐性気まぐれ白疾風広域風圧ユクモ
 */