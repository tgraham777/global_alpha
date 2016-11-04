$(document).ready(function(){
  var count = 1;

  $('#add-visual-button').click(function(){
    visual_number = count + 1;
    $('.default-topic-items').append('<h4>Visual #' + visual_number + '</h4><label for="topic_visuals_attributes_' + count + '_title">Title</label><input class="form-control" placeholder="Enter title (optional)" type="text" name="topic[visuals_attributes][' + count + '][title]" id="topic_visuals_attributes_' + count + '_title"><br><label for="topic_visuals_attributes_' + count + '_link">Link</label><input class="form-control" placeholder="Enter Tableau script or URL" type="text" name="topic[visuals_attributes][' + count + '][link]" id="topic_visuals_attributes_' + count + '_link"><br><label for="topic_visuals_attributes_' + count + '_caption">Caption</label><input class="form-control" placeholder="Enter caption for visual" type="text" name="topic[visuals_attributes][' + count + '][caption]" id="topic_visuals_attributes_' + count + '_caption"><br><label for="topic_visuals_attributes_' + count + '_description">Description</label><textarea class="form-control" placeholder="Enter description for visual and/or additional text" name="topic[visuals_attributes][' + count + '][description]" id="topic_visuals_attributes_' + count + '_description"></textarea><br><hr>');
    count++;
  });

  var visual_count = $('.edit-page-visual-counter').length;

  $('#edit-add-visual-button').click(function(){
    $('.default-topic-items').append('<hr><label for="topic_visuals_attributes_' + visual_count + '_title">Title</label><input class="form-control" type="text" value="" name="topic[visuals_attributes][' + visual_count + '][title]" id="topic_visuals_attributes_' + visual_count + '_title"><br><label for="topic_visuals_attributes_' + visual_count + '_link">Link</label><input class="form-control" type="text" value="" name="topic[visuals_attributes][' + visual_count + '][link]" id="topic_visuals_attributes_' + visual_count + '_link"><br><label for="topic_visuals_attributes_' + visual_count + '_caption">Caption</label><input class="form-control" type="text" value="" name="topic[visuals_attributes][' + visual_count + '][caption]" id="topic_visuals_attributes_' + visual_count + '_caption"><br><label for="topic_visuals_attributes_' + visual_count + '_description">Description</label><textarea class="form-control" name="topic[visuals_attributes][' + visual_count + '][description]" id="topic_visuals_attributes_' + visual_count + '_description"></textarea><br>');
    visual_count++;
  });

  $('#country-add-visual-button').click(function(){
    visual_number = count + 1;
    $('.default-country-items').append('<h4>Visual #' + visual_number + '</h4><label for="country_visuals_attributes_' + count + '_title">Title</label><input class="form-control" placeholder="Enter title (optional)" type="text" name="country[visuals_attributes][' + count + '][title]" id="country_visuals_attributes_' + count + '_title"><br><label for="country_visuals_attributes_' + count + '_link">Link</label><input class="form-control" placeholder="Enter Tableau script or URL" type="text" name="country[visuals_attributes][' + count + '][link]" id="country_visuals_attributes_' + count + '_link"><br><label for="country_visuals_attributes_' + count + '_caption">Caption</label><input class="form-control" placeholder="Enter caption for visual" type="text" name="country[visuals_attributes][' + count + '][caption]" id="country_visuals_attributes_' + count + '_caption"><br><label for="country_visuals_attributes_' + count + '_description">Description</label><textarea class="form-control" placeholder="Enter description for visual and/or additional text" name="country[visuals_attributes][' + count + '][description]" id="country_visuals_attributes_' + count + '_description"></textarea><br><hr>');
    count++;
  });

  var country_visual_count = $('.country-edit-page-visual-counter').length;

  $('#country-edit-add-visual-button').click(function(){
    $('.default-country-edit-items').append('<hr><label for="country_visuals_attributes_' + country_visual_count + '_title">Title</label><input class="form-control" type="text" value="" name="country[visuals_attributes][' + country_visual_count + '][title]" id="country_visuals_attributes_' + country_visual_count + '_title"><br><label for="country_visuals_attributes_' + country_visual_count + '_link">Link</label><input class="form-control" type="text" value="" name="country[visuals_attributes][' + country_visual_count + '][link]" id="country_visuals_attributes_' + country_visual_count + '_link"><br><label for="country_visuals_attributes_' + country_visual_count + '_caption">Caption</label><input class="form-control" type="text" value="" name="country[visuals_attributes][' + country_visual_count + '][caption]" id="country_visuals_attributes_' + country_visual_count + '_caption"><br><label for="country_visuals_attributes_' + country_visual_count + '_description">Description</label><textarea class="form-control" name="country[visuals_attributes][' + country_visual_count + '][description]" id="country_visuals_attributes_' + country_visual_count + '_description"></textarea><br>');
    country_visual_count++;
  });

  $('#indicator-add-visual-button').click(function(){
    visual_number = count + 1;
    $('.default-indicator-items').append('<h4>Visual #' + visual_number + '</h4><label for="indicator_visuals_attributes_' + count + '_title">Title</label><input class="form-control" placeholder="Enter title (optional)" type="text" name="indicator[visuals_attributes][' + count + '][title]" id="indicator_visuals_attributes_' + count + '_title"><br><label for="indicator_visuals_attributes_' + count + '_link">Link</label><input class="form-control" placeholder="Enter Tableau script or URL" type="text" name="indicator[visuals_attributes][' + count + '][link]" id="indicator_visuals_attributes_' + count + '_link"><br><label for="indicator_visuals_attributes_' + count + '_caption">Caption</label><input class="form-control" placeholder="Enter caption for visual" type="text" name="indicator[visuals_attributes][' + count + '][caption]" id="indicator_visuals_attributes_' + count + '_caption"><br><label for="indicator_visuals_attributes_' + count + '_description">Description</label><textarea class="form-control" placeholder="Enter description for visual and/or additional text" name="indicator[visuals_attributes][' + count + '][description]" id="indicator_visuals_attributes_' + count + '_description"></textarea><br><hr>');
    count++;
  });

  var indicator_visual_count = $('.indicator-edit-page-visual-counter').length;

  $('#indicator-edit-add-visual-button').click(function(){
    $('.default-indicator-edit-items').append('<hr><label for="indicator_visuals_attributes_' + indicator_visual_count + '_title">Title</label><input class="form-control" type="text" value="" name="indicator[visuals_attributes][' + indicator_visual_count + '][title]" id="indicator_visuals_attributes_' + indicator_visual_count + '_title"><br><label for="indicator_visuals_attributes_' + indicator_visual_count + '_link">Link</label><input class="form-control" type="text" value="" name="indicator[visuals_attributes][' + indicator_visual_count + '][link]" id="indicator_visuals_attributes_' + indicator_visual_count + '_link"><br><label for="indicator_visuals_attributes_' + indicator_visual_count + '_caption">Caption</label><input class="form-control" type="text" value="" name="indicator[visuals_attributes][' + indicator_visual_count + '][caption]" id="indicator_visuals_attributes_' + indicator_visual_count + '_caption"><br><label for="indicator_visuals_attributes_' + indicator_visual_count + '_description">Description</label><textarea class="form-control" name="indicator[visuals_attributes][' + indicator_visual_count + '][description]" id="indicator_visuals_attributes_' + indicator_visual_count + '_description"></textarea><br>');
    indicator_visual_count++;
  });

  $('#preview-add-visual-button').click(function(){
    visual_number = count + 1;
    $('.default-preview-items').append('<h4>Visual #' + visual_number + '</h4><label for="preview_visuals_attributes_' + count + '_title">Title</label><input class="form-control" placeholder="Enter title (optional)" type="text" name="preview[visuals_attributes][' + count + '][title]" id="preview_visuals_attributes_' + count + '_title"><br><label for="preview_visuals_attributes_' + count + '_link">Link</label><input class="form-control" placeholder="Enter Tableau script or URL" type="text" name="preview[visuals_attributes][' + count + '][link]" id="preview_visuals_attributes_' + count + '_link"><br><label for="preview_visuals_attributes_' + count + '_caption">Caption</label><input class="form-control" placeholder="Enter caption for visual" type="text" name="preview[visuals_attributes][' + count + '][caption]" id="preview_visuals_attributes_' + count + '_caption"><br><label for="preview_visuals_attributes_' + count + '_description">Description</label><textarea class="form-control" placeholder="Enter description for visual and/or additional text" name="preview[visuals_attributes][' + count + '][description]" id="preview_visuals_attributes_' + count + '_description"></textarea><br><hr>');
    count++;
  });
});
