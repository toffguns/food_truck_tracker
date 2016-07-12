function loadAndCreateGmap() {
  // Only load map data if we have a map on the page
  if ($('#map').length > 0) {
    $.ajax({
      dataType: 'json',
      url: '/landing_page/' + 'map_location',
      method: 'GET',
      data: '',
      success: function(data) {
        createGmap(data);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};
function createGmap(data) {
  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {center: {lat: 32.7157, lng: -117.1}},
      internal: {id: 'map'},


    },
    function() {
      markers = handler.addMarkers(data);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(11);
    }
  );
};


// Create the map when the page loads the first time
$(document).on('ready', loadAndCreateGmap);
// Create the map when the contents is loaded using turbolinks
// To be 'turbolinks:load' in Rails 5
$(document).on('page:load', loadAndCreateGmap);
