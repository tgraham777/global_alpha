$(document).ready(function(){
  $('#add-visual-button').click(function(){
    $('.default-topic-items').append('<br><label for="visual_link_1">Visual link 1</label><input type="visual_link_1" name="visual_link_1" id="visual_link_1" class="form-control" placeholder="Enter link or URL"><br><label for="caption_1">Caption 1</label><input type="caption_1" name="caption_1" id="caption_1" class="form-control" placeholder="Enter caption for visual"><br><label for="description_1">Description 1</label><input type="description_1" name="description_1" id="description_1" class="form-control" placeholder="Enter description for visual and/or additional text"><br>');
  });
});
