$(document).ready(function(){
  var count = 1;

  $('#add-visual-button').click(function(){
    count++;
    $('.default-topic-items').append('<br><label for="visual_link_"' + count + '>Visual link ' + count + '</label><input type="visual_link_' + count + '" name="visual_link_' + count + '" id="visual_link_' + count + '" class="form-control" placeholder="Enter link or URL"><br><label for="caption_' + count + '">Caption ' + count + '</label><input type="caption_' + count + '" name="caption_' + count + '" id="caption_' + count + '" class="form-control" placeholder="Enter caption for visual"><br><label for="description_' + count + '">Description ' + count + '</label><textarea type="description_' + count + '" name="description_' + count + '" id="description_' + count + '" class="form-control" placeholder="Enter description for visual and/or additional text"></textarea><br>');
  });
});
