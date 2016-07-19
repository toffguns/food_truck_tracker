function searchOrCenterMap() {
  if (($("#search-select").val() === "search_trucks")) {
    loadAndCreateGmapSearch();
  } else {
    loadAndCreateGmapRecenter();
  }
};

function loadAndCreateGmapRecenter() {
  // Format data from the address search so that it can be inserted into
  // the https request to the google maps api
  var formatted_input = $("#search_field").val().split(" ").join("+");

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
        alert("Your Search Cannot Be Blank " + errorThrown);
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
    searchOrCenterMap);
    $('.message a').click(function(){
     $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
  });
});
