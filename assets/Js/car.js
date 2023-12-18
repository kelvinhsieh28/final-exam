function minus(){
    var number = Number (document.getElementsByClassName("item_num")[0].value);
    if (number > 1){
        number -= 1;
        document.getElementsByClassName("item_num")[0].value = number;
    }else window.alert("商品數量不得少於1");
}

function add(){
    var number = Number (document.getElementsByClassName("item_num")[0].value);
    if (number < 100){
        number += 1;
        document.getElementsByClassName("item_num")[0].value = number;
    }else window.alert("商品數量不得超過100");
}