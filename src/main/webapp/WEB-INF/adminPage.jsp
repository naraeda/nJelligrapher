<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jelligrapher</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 50%;
        width: 50%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    
</head>
<body>
	
	<a href="mailTo:cherry2ney@gmail.com"> Contact Us</a>
	
	<h2><p id="city">${ event.city }</p></h2>
	

    <div id="map"></div>
    <script>
    	
      var map;
      var service;
      var infowindow;
	var lat;
	var lng;

		

      function initMap() {
  	
			var location = $('#city').text();
			$.getJSON('https://maps.googleapis.com/maps/api/geocode/json?&address='+ location + '&key=AIzaSyCF-SC0scu2ZMqEbTYJ28BwlFQFIiNh8rc', function(data) {
				lat = data.results[0].geometry.location.lat;
				lng = data.results[0].geometry.location.lng;
				console.log(lat, lng);
				})
			
        var city = new google.maps.LatLng(lat, lng);

        infowindow = new google.maps.InfoWindow();

        map = new google.maps.Map(
            document.getElementById('map'), {center: city, zoom: 15});

        var request = {
          query: location,
          fields: ['name', 'geometry'],
        };

        service = new google.maps.places.PlacesService(map);

        service.findPlaceFromQuery(request, function(results, status) {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            for (var i = 0; i < results.length; i++) {
              createMarker(results[i]);
            }

            map.setCenter(results[0].geometry.location);
          }
        });
      }

      function createMarker(place) {
        var marker = new google.maps.Marker({
          map: map,
          position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent(place.name);
          infowindow.open(map, this);
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCF-SC0scu2ZMqEbTYJ28BwlFQFIiNh8rc&libraries=places&callback=initMap" async defer></script>

</body>
</html>