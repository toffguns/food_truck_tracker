function loadAndCreateGmapSearch() {
  // Only load map data if we have a map on the page
  if ($('#map').length > 0) {
    $.ajax({
      dataType: 'json',
      url: '/landing_page/search?search=' + $('#search_field').val(),
      method: 'GET',
      data: '',
      success: function(data) {
        createGmapSearch(data);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};
function createGmapSearch(data) {
  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {center: {lat: 32.7157, lng: -117.1}},
      internal: {id: 'map'}
    },
    function() {
      markers = handler.addMarkers(data);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(11);
    }
  );
};


//
$("document").ready(function() {
  $('#search_button').on('click',
    loadAndCreateGmapSearch);
});
