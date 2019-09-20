<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/eventDetails.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="/favicon.ico"/>
<title>nJelligrapher</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->

</head>
<body>
<div class="container">
<h1 class="detailTitle">Details about "<c:out value="${event.name}"/>!"</h1><a class="but2" href="/events"><button>Back to Dashboard</button></a>

<div class="leftContent">
	<h3>Host: <c:out value="${event.host.firstName}"/> <c:out value="${event.host.lastName}"/></h3>
	<h3>Date: <fmt:formatDate value="${event.date}" pattern="MMMM dd, yyyy"/></h3>
	<h3>Location: <c:out value="${event.city}"/>, <c:out value="${event.state}"/></h3>
	<h3>Description: <c:out value="${event.description}"/></h3>

	
	<div class="box">
         <a class="button" href="#popup1">Edit</a>
    </div>
            
            <div id="popup1" class="overlay">
                <div class="popup">
                    <h2>Edit the event: </h2>
                    <a class="close" href="#">&times;</a>
                    <div class="content">
                            
						<div class="edit">
						
							<form:form action="/events/${event.id}/edit" method="post" modelAttribute="event">
								<input type="hidden" name="_method" value="put">
								<p>
									<form:label path="name">Name: </form:label>
									<form:input type="text" placeholder="Event Name" path="name"/>
								</p>
								<p>
									<form:label path="date">Date: </form:label>
									<form:input type="date" path="date"/>
								</p>
								<p>
									<form:label path="description">Description: </form:label>
									<form:textarea type="text" rows="4" cols="50" placeholder="Tell us about the event!" path="description"/>
								</p>
								<p>
									<form:label path="city">Location: </form:label>
									<form:input type="text" placeholder="City of event" path="city"/>
									
									<form:select path="state">
											<form:option value="AL">AL</form:option>
											<form:option value="AK">AK</form:option>
											<form:option value="AZ">AZ</form:option>
											<form:option value="AR">AR</form:option>
											<form:option value="CA">CA</form:option>
											<form:option value="CO">CO</form:option>
											<form:option value="CT">CT</form:option>
											<form:option value="DE">DE</form:option>
											<form:option value="DC">DC</form:option>
											<form:option value="FL">FL</form:option>
											<form:option value="GA">GA</form:option>
											<form:option value="HI">HI</form:option>
											<form:option value="ID">ID</form:option>
											<form:option value="IL">IL</form:option>
											<form:option value="IN">IN</form:option>
											<form:option value="IA">IA</form:option>
											<form:option value="KS">KS</form:option>
											<form:option value="KY">KY</form:option>
											<form:option value="LA">LA</form:option>
											<form:option value="ME">ME</form:option>
											<form:option value="MD">MD</form:option>
											<form:option value="MA">MA</form:option>
											<form:option value="MI">MI</form:option>
											<form:option value="MN">MN</form:option>
											<form:option value="MS">MS</form:option>
											<form:option value="MO">MO</form:option>
											<form:option value="MT">MT</form:option>
											<form:option value="NE">NE</form:option>
											<form:option value="NV">NV</form:option>
											<form:option value="NH">NH</form:option>
											<form:option value="NJ">NJ</form:option>
											<form:option value="NM">NM</form:option>
											<form:option value="NY">NY</form:option>
											<form:option value="NC">NC</form:option>
											<form:option value="ND">ND</form:option>
											<form:option value="OH">OH</form:option>
											<form:option value="OK">OK</form:option>
											<form:option value="OR">OR</form:option>
											<form:option value="PA">PA</form:option>
											<form:option value="RI">RI</form:option>
											<form:option value="SC">SC</form:option>
											<form:option value="SD">SD</form:option>
											<form:option value="TN">TN</form:option>
											<form:option value="TX">TX</form:option>
											<form:option value="UT">UT</form:option>
											<form:option value="VT">VT</form:option>
											<form:option value="VA">VA</form:option>
											<form:option value="WA">WA</form:option>
											<form:option value="WV">WV</form:option>
											<form:option value="WI">WI</form:option>
											<form:option value="WY">WY</form:option>
										</form:select>				
								</p>
								<form:hidden path="host" value="${user.id}"></form:hidden>
								<button >Edit</button>
							</form:form>
						</div>
                    </div>
                </div>
            </div>
            
	<div class="delete">
		<form action="/events/${event.id}" method="post">
			<input type="hidden" name="_method" value="delete">
			<button >Delete</button>
		</form>
	</div>
 	<div class="search">
	<form action="/search" method="post" >
		<input type="search" name="tag" placeholder="search tags here..">
		<button>Search Tags</button>
	</form>

	</div> 
</div>

	
<div class="rightContent">
	<h4>Submit your pictures here: </h4>
	<%-- <p><form:errors path="photo.*"/></p> --%>
	<form:form method="POST" action="/test"  modelAttribute="picture" enctype="multipart/form-data">
        <p>
            <label for="imgUrl">Image:</label>
            <input type="file" name="imgUrl" class="fileinput"/>
        </p>
        <p>
            <form:label path="title">Title:</form:label>
            <form:input type="text" path="title"/>
        </p>
       	<p>
            <form:label path="city">City:</form:label>
            <form:input type="text" path="city"/>
        </p>
        <p>
            <form:label path="state">State:</form:label>
                <form:select path="state">
					<form:option value="AL">AL</form:option>
					<form:option value="AK">AK</form:option>
					<form:option value="AZ">AZ</form:option>
					<form:option value="AR">AR</form:option>
					<form:option value="CA">CA</form:option>
					<form:option value="CO">CO</form:option>
					<form:option value="CT">CT</form:option>
					<form:option value="DE">DE</form:option>
					<form:option value="DC">DC</form:option>
					<form:option value="FL">FL</form:option>
					<form:option value="GA">GA</form:option>
					<form:option value="HI">HI</form:option>
					<form:option value="ID">ID</form:option>
					<form:option value="IL">IL</form:option>
					<form:option value="IN">IN</form:option>
					<form:option value="IA">IA</form:option>
					<form:option value="KS">KS</form:option>
					<form:option value="KY">KY</form:option>
					<form:option value="LA">LA</form:option>
					<form:option value="ME">ME</form:option>
					<form:option value="MD">MD</form:option>
					<form:option value="MA">MA</form:option>
					<form:option value="MI">MI</form:option>
					<form:option value="MN">MN</form:option>
					<form:option value="MS">MS</form:option>
					<form:option value="MO">MO</form:option>
					<form:option value="MT">MT</form:option>
					<form:option value="NE">NE</form:option>
					<form:option value="NV">NV</form:option>
					<form:option value="NH">NH</form:option>
					<form:option value="NJ">NJ</form:option>
					<form:option value="NM">NM</form:option>
					<form:option value="NY">NY</form:option>
					<form:option value="NC">NC</form:option>
					<form:option value="ND">ND</form:option>
					<form:option value="OH">OH</form:option>
					<form:option value="OK">OK</form:option>
					<form:option value="OR">OR</form:option>
					<form:option value="PA">PA</form:option>
					<form:option value="RI">RI</form:option>
					<form:option value="SC">SC</form:option>
					<form:option value="SD">SD</form:option>
					<form:option value="TN">TN</form:option>
					<form:option value="TX">TX</form:option>
					<form:option value="UT">UT</form:option>
					<form:option value="VT">VT</form:option>
					<form:option value="VA">VA</form:option>
					<form:option value="WA">WA</form:option>
					<form:option value="WV">WV</form:option>
					<form:option value="WI">WI</form:option>
					<form:option value="WY">WY</form:option>
			</form:select>
        </p>
        <p>
     		<label>Tags:</label>
     		<input type="text" name="tag"/>
        </p>
    <form:hidden path="user" value="${user.id}"></form:hidden>
    <form:hidden path="event" value="${event.id}"></form:hidden>
    <button>Submit</button>
    </form:form> 
	
	<!--  -->
</div>
	
<!-- map -->
<%-- 
	<h2><p id="cityLocation">${ event.city }</p></h2>
	

    <div id="map"></div>
    <script>
    	
      var map;
      var service;
      var infowindow;
	var lat;
	var lng;

		

      function initMap() {
  	
			var location = $('#cityLocation').text();
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


 --%>

<!-- map -->
	
</div>
</body>
</html>