$(document).ready(function(){
  var slideimages = new Array()
  slideimages[0] = new Image()
  slideimages[0].src = "/images/img1.jpg"
  slideimages[1] = new Image()
  slideimages[1].src = "/images/img2.jpg"
  slideimages[2] = new Image()
  slideimages[2].src = "/images/img3.jpg"

  var step = 1;

  setInterval(function(){
    $('#img')[0].src = slideimages[step].src;

    if(step < 2) {
      step++;
    } else {
      step = 0;
    }
  }, 7000);

  $('#img').click(function(event){
    window.alert("You need to sign in!");
    return false;
  })

  $('#left-arrow').click(function(event){
    moveLeft();
    return false;
  })

  $('#right-arrow').click(function(event){
    moveRight();
    return false;
  })

  function moveRight(){
    $('#img')[0].src = slideimages[step].src;

    if(step < 2) {
      step++;
    } else {
      step = 0;
    }
  }

  function moveLeft(){
    if(step === 1){
      $('#img')[0].src = slideimages[2].src;
      step--;
    } else if(step === 2) {
      $('#img')[0].src = slideimages[0].src;
      step--;
    } else if(step === 0){
      $('#img')[0].src = slideimages[1].src;
      step = 2;
    }
  }
});
