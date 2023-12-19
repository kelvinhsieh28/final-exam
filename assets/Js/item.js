var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("singleSlide");
  if (n > slides.length) { slideIndex = 1; }
  if (n < 1) { slideIndex = slides.length; }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slides[slideIndex - 1].style.display = "block";
}

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