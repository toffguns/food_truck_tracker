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
        getDatabaseValues(data);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

function getDatabaseValues(input) {
  var latitude = input.results[0].geometry.location.lat;
  var longitude = input.results[0].geometry.location.lng;
  $.ajax({
    dataType: 'json',
    url: '/landing_page/get_markers_by_address?latitude=' + latitude + '&longitude=' + longitude,
    method: 'GET',
    data: '',
    success: function(data) {
      data["map_center"] = input;
      createGmapRecenter(data);
    },
    error: function(jqXHR, textStatus, errorThrown) {
      alert("Getting database data failed: " + errorThrown);
    }
  });
};

function createGmapRecenter(data) {
  var latitude = data.map_center.results[0].geometry.location.lat;
  var longitude = data.map_center.results[0].geometry.location.lng;
  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {center: {lat: latitude, lng: longitude}},
      internal: {id: 'map'}
    },
    function() {
      markers = handler.addMarkers(data);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
  );
};


$("document").ready(function() {
  $('#recenter_map_button').on('click',
    loadAndCreateGmapRecenter);
});
