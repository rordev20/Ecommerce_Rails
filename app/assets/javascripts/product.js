var ProductUtil = {}

$(document).ready(function () {
    //initiate the plugin and pass the id of the div containing gallery images
  $("#cover_image").elevateZoom({gallery:'image_gallery', cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true, loadingIcon: 'http://www.elevateweb.co.uk/spinner.gif'}); 

  //pass the images to Fancybox
  $("#cover_image").bind("click", function(e) {
    var ez =   $('#cover_image').data('elevateZoom');
    $.fancybox(ez.getGalleryList());
    return false;
  });
});
