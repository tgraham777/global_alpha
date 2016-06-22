$(document).ready(function(){
  

  var step = 1;

  var interval = setInterval(function(){
    if(step === 1){
      $('#img1').fadeOut(1500);
      step++;
    } else if(step === 2){
      $('#img2').fadeOut(1500);
      step = 0;
    } else if(step === 0){
      $('#img1').fadeIn(1500);
      $('#img2').fadeIn(1500);
      step++;
    }

    changeButtonOpacity();
  }, 7000);

  $('#left-arrow').click(function(event){
    moveLeft();
    changeButtonOpacity();
    return false;
  })

  $('#right-arrow').click(function(event){
    moveRight();
    changeButtonOpacity();
    return false;
  })

  function moveRight(){
    clearInterval(interval);
    if(step === 1){
      $('#img2').fadeIn(1500);
      $('#img1').fadeOut(1500);
      step++;
    } else if(step === 2){
      $('#img3').fadeIn(1500);
      $('#img2').fadeOut(1500);
      step = 0;
    } else if(step === 0){
      $('#img1').fadeIn(1500);
      $('#img3').fadeOut(1500);
      step++;
    }
  }
});
