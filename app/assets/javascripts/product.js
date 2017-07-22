var ProductUtil = {}

$(document).ready(function () {
    //initiate the plugin and pass the id of the div containing gallery images
  $("#cover_image").elevateZoom({gallery:'image_gallery', cursor: 'pointer', galleryActiveClass: 'active'});

  //pass the images to Fancybox
  $("#cover_image").bind("click", function(e) {
    var ez =   $('#cover_image').data('elevateZoom');
    $.fancybox(ez.getGalleryList());
    return false;
  });
});
