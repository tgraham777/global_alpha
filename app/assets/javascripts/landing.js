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
    changeOpacity();
  }, 7000);

  $('#img').click(function(event){
    window.location.href = '/login';
    return false;
  })

  $('#left-arrow').click(function(event){
    moveLeft();
    changeOpacity();
    return false;
  })

  $('#right-arrow').click(function(event){
    moveRight();
    changeOpacity();
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

  $('#landing-control-hottop').click(function(event){
    $('#img')[0].src = slideimages[0].src;
    step = 1;
    changeOpacity();
    return false;
  })

  $('#landing-control-macro').click(function(event){
    $('#img')[0].src = slideimages[1].src;
    step = 2;
    changeOpacity();
    return false;
  })

  $('#landing-control-finmkt').click(function(event){
    $('#img')[0].src = slideimages[2].src;
    step = 0;
    changeOpacity();
    return false;
  })

  function changeOpacity(){
    if(step === 0){
      $('#landing-control-hottop').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
      $('#landing-control-macro').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
      $('#landing-control-finmkt').css({ 'opacity' : 1, 'border-width' : 'medium', 'color' : 'green', 'border-color' : 'green' });
    } else if(step === 1){
      $('#landing-control-hottop').css({ 'opacity' : 1, 'border-width' : 'medium', 'color' : 'green', 'border-color' : 'green' });
      $('#landing-control-macro').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
      $('#landing-control-finmkt').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
    } else {
      $('#landing-control-hottop').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
      $('#landing-control-macro').css({ 'opacity' : 1, 'border-width' : 'medium', 'color' : 'green', 'border-color' : 'green' });
      $('#landing-control-finmkt').css({ 'opacity' : 0.5, 'border-width' : 'thin', 'color' : '#AAA', 'border-color' : '#CCC' });
    }
  }
});
