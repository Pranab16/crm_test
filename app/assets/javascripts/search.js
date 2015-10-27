function init_search(search_url){
  $.widget( "custom.catcomplete", $.ui.autocomplete, {
    _renderMenu: function( ul, items ) {
      var self = this,
          currentCategory = '';
      $.each( items, function( index, item ) {
        var li;
        if(item.category === undefined){
//          ul.append( "<li class='ui-menu-item category'>" + item.category + "</li>" );
          self._renderItemData( ul, item );
        }else{
          if ( item.category != currentCategory ) {
            ul.append( "<li class='ui-menu-item category'>" + item.category + "</li>" );
            currentCategory = item.category;
          }
          self._renderItemData( ul, item ).addClass('product');
//          if ( item.category ) {
//            li.attr( "aria-label", item.category + " : " + item.label );
//          }
        }
      });
    }
  });

  $('#search').catcomplete({
    delay: 0,
    source: function( request, response ) {
      var suggestions = get_suggestions(request.term, search_url);
      if($.trim(suggestions[0]).length==0){ //acknowledge that no suggestions were found
        suggestions= ["No matches found"];
      }
      response(suggestions);
    }
  })
}

function get_suggestions(key, search_url){
  var searched_resources = $.ajax({
    type: "get",
    url: search_url,
    data: {
      "key": key
    },
    async: false
  }).responseText;
  return JSON.parse(searched_resources);
}