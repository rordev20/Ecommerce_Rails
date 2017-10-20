$(document).on("click", ".product_sizes .has_many_add", function(event) {
  var sub_category_id = $('#product_sub_category_id').val()
  if (sub_category_id){
    $.ajax({
      type: 'GET',
      url: '/admin/get_category_sizes',
      data: { sub_category_id: sub_category_id },
      dataType: "json",
      success: (function (data) {
      console.log(data)
        var product_size_elements = $("[name^='product[product_sizes_attributes]']")
        $.each(product_size_elements, function (i, obj) {
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




