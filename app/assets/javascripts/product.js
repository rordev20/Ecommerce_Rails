var ProductUtil = {
  submitSearchForm: function(data){
    var form_data = $('form#filter_form').serialize();
    var myURL = window.location.href.split('?')[0];
    var absouteURL = myURL + '?' + form_data;
    history.pushState('', 'Product Page', absouteURL);
    $('form#filter_form').submit();
  }
}

$(document).on('ready page:load', function() {
  //initiate the plugin and pass the id of the div containing gallery images
  $("#cover_image").elevateZoom({gallery:'image_gallery', cursor: 'pointer', galleryActiveClass: 'active'});

  //pass the images to Fancybox
  $("#cover_image").bind("click", function(e) {
    var ez =   $('#cover_image').data('elevateZoom');
    $.fancybox(ez.getGalleryList());
    return false;
  });
});

$(document).on("click", "input[type=checkbox]", function(event) {
  ProductUtil.submitSearchForm();
});
