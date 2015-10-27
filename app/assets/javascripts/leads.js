function init_leads(){

  $('.add_new_lead_link').click(function(){
    $(this).addClass('hide');
    var parent = $(this).closest('.new_lead_text').parent();
    var newElement = parent.find('.new_lead_form').clone().removeClass('hide');
    parent.append(newElement);
    newElement.find('.lead_scheduled_time').datetimepicker();
  });

}
