//= require active_admin/base
//= require activeadmin_addons/all
//= require just_datetime_picker/nested_form_workaround
//= require admin/product
$(document).on('ready page:load', function () {
  $(".product_attributes .has_many_add").on("click", function(event) {
    var sub_category_id = $('#product_sub_category_id').val()
    if (sub_category_id){
      $.ajax({
        type: 'GET',
        url: '/admin/get_sub_category_attributes',
        data: { sub_category_id: sub_category_id },
        dataType: "json",
        success: (function (data) {
          var sub_category_elements = $("[id$='_sub_category_attribute_id']")
          $.each(sub_category_elements, function (i, obj) {
            if(!obj.value){
              removeChildNodes(obj)
              creatProductAttributes(data, obj);
            }  
          })
        })
      })
    }
    else {
      alert('Please select subcategory');
      event.preventDefault();
      return false;
    }
  });

  function creatProductAttributes(data, obj){
    $('<option value="">' +  + '</option>').appendTo(obj);
    for (var field in data) {
      $('<option value="'+ data[field].id +'">' + data[field].name + '</option>').appendTo(obj);
    }
  }

  function removeChildNodes(obj){
    while (obj.hasChildNodes()) {
      obj.removeChild(obj.lastChild);
    }
  }
});


