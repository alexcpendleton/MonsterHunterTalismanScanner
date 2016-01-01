var fullCharacterSet = []
var everything = [];
var listItems = document.querySelectorAll(".pure-g.poogie-li");
var listItemLength = listItems.length;
for(var i = 0; i < listItemLength; i++) {
    var current = listItems[i];
    if (current && current.children && current.children.length > 1) {
        var enNode = current.children[0];
        var jpNode = current.children[1];
        everything.push({en:enNode.innerText, jp:jpNode.innerText});
        fullCharacterSet.push(jpNode.innerText);
    }
}
console.log(JSON.stringify(everything))
console.log(everything.map(function(j){return j.jp}).join("\r\n"))