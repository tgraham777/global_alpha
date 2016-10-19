$(document).ready(function(){
  var count = 1;

  $('#add-visual-button').click(function(){
    visual_number = count + 1;
    $('.default-topic-items').append('<h4>Visual #' + visual_number + '</h4><label for="topic_visuals_attributes_' + count + '_link">Link</label><input class="form-control" placeholder="Enter Tableau script or URL" type="text" name="topic[visuals_attributes][' + count + '][link]" id="topic_visuals_attributes_' + count + '_link"><br><label for="topic_visuals_attributes_' + count + '_caption">Caption</label><input class="form-control" placeholder="Enter caption for visual" type="text" name="topic[visuals_attributes][' + count + '][caption]" id="topic_visuals_attributes_' + count + '_caption"><br><label for="topic_visuals_attributes_' + count + '_description">Description</label><textarea class="form-control" placeholder="Enter description for visual and/or additional text" name="topic[visuals_attributes][' + count + '][description]" id="topic_visuals_attributes_' + count + '_description"></textarea><br><hr>');
    count++;
  });

  var visual_count = $('.edit-page-visual-counter').length;

  $('#edit-add-visual-button').click(function(){
    $('.default-topic-items').append('<hr><label for="topic_visuals_attributes_' + visual_count + '_link">Link</label><input class="form-control" type="text" value="" name="topic[visuals_attributes][' + visual_count + '][link]" id="topic_visuals_attributes_' + visual_count + '_link"><br><label for="topic_visuals_attributes_' + visual_count + '_caption">Caption</label><input class="form-control" type="text" value="" name="topic[visuals_attributes][' + visual_count + '][caption]" id="topic_visuals_attributes_' + visual_count + '_caption"><br><label for="topic_visuals_attributes_' + visual_count + '_description">Description</label><textarea class="form-control" name="topic[visuals_attributes][' + visual_count + '][description]" id="topic_visuals_attributes_' + visual_count + '_description"></textarea><br>');
    visual_count++;
  });

  $('#country-add-visual-button').click(function(){
    visual_number = count + 1;
    $('.default-country-items').append('<h4>Visual #' + visual_number + '</h4><label for="country_visuals_attributes_' + count + '_link">Link</label><input class="form-control" placeholder="Enter Tableau script or URL" type="text" name="country[visuals_attributes][' + count + '][link]" id="country_visuals_attributes_' + count + '_link"><br><label for="country_visuals_attributes_' + count + '_caption">Caption</label><input class="form-control" placeholder="Enter caption for visual" type="text" name="country[visuals_attributes][' + count + '][caption]" id="country_visuals_attributes_' + count + '_caption"><br><label for="country_visuals_attributes_' + count + '_description">Description</label><textarea class="form-control" placeholder="Enter description for visual and/or additional text" name="country[visuals_attributes][' + count + '][description]" id="country_visuals_attributes_' + count + '_description"></textarea><br><hr>');
    count++;
  });
});
