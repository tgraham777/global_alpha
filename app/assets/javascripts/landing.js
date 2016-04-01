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

  // function moveLeft(){
  //   if(step === 1){
  //     $('#img1').fadeOut(1500);
  //     $('#img2').fadeOut(1500);
  //     // $('img')[1].src = slideimages[2].src;
  //     step--;
  //   } else if(step === 2) {
  //     // $('img')[1].src = slideimages[0].src;
  //     step--;
  //   } else if(step === 0){
  //     // $('img')[1].src = slideimages[1].src;
  //     step = 2;
  //   }
  // }

  $('#landing-control-hottop').click(function(event){
    clearInterval(interval);
    $('#img1').fadeIn(1500);
    $('#img2').fadeOut(1500);
    $('#img3').fadeOut(1500);
    step = 1;
    changeButtonOpacity();
    return false;
  })

  $('#landing-control-macro').click(function(event){
    clearInterval(interval);
    $('#img1').fadeOut(1500);
    $('#img2').fadeIn(1500);
    $('#img3').fadeOut(1500);
    step = 2;
    changeButtonOpacity();
    return false;
  })

  $('#landing-control-finmkt').click(function(event){
    clearInterval(interval);
    $('#img1').fadeOut(1500);
    $('#img2').fadeOut(1500);
    $('#img3').fadeIn(1500);
    step = 0;
    changeButtonOpacity();
    return false;
  })

  function changeButtonOpacity(){
    if(step === 0){
      $('#landing-control-hottop').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
      $('#landing-control-macro').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
      $('#landing-control-finmkt').css({ 'opacity' : 1, 'border-width' : 'medium', 'color' : '#000060', 'border-color' : '#000060' });
    } else if(step === 1){
      $('#landing-control-hottop').css({ 'opacity' : 1, 'border-width' : 'medium', 'color' : '#000060', 'border-color' : '#000060' });
      $('#landing-control-macro').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
      $('#landing-control-finmkt').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
    } else {
      $('#landing-control-hottop').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
      $('#landing-control-macro').css({ 'opacity' : 1, 'border-width' : 'medium', 'color' : '#000060', 'border-color' : '#000060' });
      $('#landing-control-finmkt').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
    }
  }
});
