$(document).ready(function(){var t=1;$("#add-visual-button").click(function(){visual_number=t+1,$(".default-topic-items").append("<h4>Visual #"+visual_number+'</h4><label for="topic_visuals_attributes_'+t+'_link">Link</label><input class="form-control" placeholder="Enter Tableau script or URL" type="text" name="topic[visuals_attributes]['+t+'][link]" id="topic_visuals_attributes_'+t+'_link"><br><label for="topic_visuals_attributes_'+t+'_caption">Caption</label><input class="form-control" placeholder="Enter caption for visual" type="text" name="topic[visuals_attributes]['+t+'][caption]" id="topic_visuals_attributes_'+t+'_caption"><br><label for="topic_visuals_attributes_'+t+'_description">Description</label><textarea class="form-control" placeholder="Enter description for visual and/or additional text" name="topic[visuals_attributes]['+t+'][description]" id="topic_visuals_attributes_'+t+'_description"></textarea><br><hr>'),t++});var i=$(".edit-page-visual-counter").length;$("#edit-add-visual-button").click(function(){$(".default-topic-items").append('<hr><label for="topic_visuals_attributes_'+i+'_link">Link</label><input class="form-control" type="text" value="" name="topic[visuals_attributes]['+i+'][link]" id="topic_visuals_attributes_'+i+'_link"><br><label for="topic_visuals_attributes_'+i+'_caption">Caption</label><input class="form-control" type="text" value="" name="topic[visuals_attributes]['+i+'][caption]" id="topic_visuals_attributes_'+i+'_caption"><br><label for="topic_visuals_attributes_'+i+'_description">Description</label><textarea class="form-control" name="topic[visuals_attributes]['+i+'][description]" id="topic_visuals_attributes_'+i+'_description"></textarea><br>'),i++})});