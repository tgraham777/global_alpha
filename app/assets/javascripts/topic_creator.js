$(document).ready(function(){
  var count = 1;

  $('#add-visual-button').click(function(){
    count++;
    $('.default-topic-items').append('<h4>Visual #' + count + '</h4><label for="topic_visual_link">Link</label><input class="form-control" placeholder="Enter Tableau script or URL" type="text" name="topic[visual][link]" id="topic_visual_link"><br><label for="topic_visual_caption">Caption</label><input class="form-control" placeholder="Enter caption for visual" type="text" name="topic[visual][caption]" id="topic_visual_caption"><br><label for="topic_visual_description">Description</label><textarea class="form-control" placeholder="Enter description for visual and/or additional text" name="topic[visual][description]" id="topic_visual_description"></textarea><br><hr>');
  });
});
