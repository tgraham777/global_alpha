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

  $('#img').click(function(){
    window.alert("You need to sign in!");
  })

  $('#left-arrow').click(function(){
    window.alert("You clicked the left arrow!");
  })

  $('#right-arrow').click(function(){
    window.alert("You clicked the right arrow!");
  })
});
