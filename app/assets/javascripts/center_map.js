function loadAndCreateGmapRecenter() {
  // Format data from the address search so that it can be inserted into
  // the https request to the google maps api
  var formatted_input = $("#address_search_field").val().split(" ").join("+");

  // Only load map data if we have a map on the page
  if ($('#map').length > 0) {
    $.ajax({
      dataType: 'json',
      url: 'https://maps.googleapis.com/maps/api/geocode/json?address=' + formatted_input + '&key=AIzaSyAkSva5o6sXhpw3DGF2jzNVTKQIsfR7vuc',
      method: 'GET',
      data: '',
      success: function(data) {
        createGmapRecenter(data);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};
function createGmapRecenter(data) {
  var latitude = data.results[0].geometry.location.lat;
  var longitude = data.results[0].geometry.location.lng;
  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {center: {lat: latitude, lng: longitude}},
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


$("document").ready(function() {
  $('#recenter_map_button').on('click',
    loadAndCreateGmapRecenter);
});
