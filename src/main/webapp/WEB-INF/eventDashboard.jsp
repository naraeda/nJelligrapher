<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/dashboard.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Events Dashboard</title>
</head>
<body>
	<h1>Welcome, user</h1>
	<a href="/announcements"><button type="button" class="btn btn-info btn-sm">Announcements</button></a>
	<a href=""><button type="button" class="btn btn-info btn-sm">View Submitted Pictures</button></a>
	
	<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">Add An Event</button>
	
	<h3>Events near you: </h3>
	<table>
		<thead>
			<tr>
				<th> Event Name </th>
				<th> Date </th>
				<th> Location </th>
				<th> Host </th>
				<th> Action </th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach items="${eventsInState}" var ="e">
		<tr>
			<td><a href="/events/${e.id}"><c:out value="${e.name}"/></a></td>
			<td><fmt:formatDate value="${e.date}" pattern="MMMM dd, yyyy"/></td>
			<td><c:out value="${e.city}"/>, <c:out value="${e.state}"/></td>
			<td><c:out value="${e.host.firstName}"/> <c:out value="${e.host.lastName}"/></td>
			<td>
			
			<%-- <c:if test="${e.host.id == user.id}">
				<a href="/events/${e.id}/edit"><button>Edit</button></a>
				
				<form action="/events/${e.id}" method="post">
				    <input type="hidden" name="_method" value="delete">
					<button>Delete</button>
				</form>
			</c:if> --%>
			
			<%-- <c:if test="${e.host.id != user.id}"> --%>
				<c:set var="attending" value="null" />
			
				<c:forEach items="${e.users}" var="u">
					<c:if test="${u.id == user.id}">
						<c:set var="attending" value="true" />
					</c:if>
				</c:forEach>
				
				<c:if test="${attending.contains('null')}">	
			
					<form:form action="/events/join" method="POST" modelAttribute="middleTable">
						<form:hidden path="user" value="${user.id}"></form:hidden>
						<form:hidden path="event" value="${e.id}"></form:hidden>
						<button>Join Event</button>
					</form:form>
				</c:if>
				
				<c:if test="${attending == true }">
					<form action="/events/cancel" method="post">
					    <input type="hidden" name="_method" value="delete">
					    
						<input type="hidden"  name="user" value="${user.id}">
						<input type="hidden"  name="event" value="${e.id}">
					    Joining <button>Cancel</button>
					</form>
					
				</c:if>
				
			<%-- </c:if> --%>
				

			</td>
		</tr>
	</c:forEach> 
		</tbody>
	</table>
	
	<h3>Events in other locations: </h3>
	<table>
		<thead>
			<tr>
				<th> Event Name </th>
				<th> Date </th>
				<th> Location </th>
				<th> Host </th>
				<th> Action </th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach items="${eventsOutState}" var ="e">
		<tr>
			<td><a href="/events/${e.id}"><c:out value="${e.name}"/></a></td>
			<td><fmt:formatDate value="${e.date}" pattern="MMMM dd, yyyy"/></td>
			<td><c:out value="${e.city}"/>, <c:out value="${e.state}"/></td>
			<td><c:out value="${e.host.firstName}"/> <c:out value="${e.host.lastName}"/></td>
			<td>
			<%-- <c:if test="${e.host.id == user.id}">
				<a href="/events/${e.id}/edit"><button>Edit</button></a>
				<form action="/events/${e.id}" method="post">
				    <input type="hidden" name="_method" value="delete">
					<button>Delete</button>
				</form>
			</c:if> --%>
			<%-- <c:if test="${e.host.id != user.id}"> --%>
				<c:set var="attending" value="null" />
			
				<c:forEach items="${e.users}" var="u">
					<c:if test="${u.id == user.id}">
						<c:set var="attending" value="true" />
					</c:if>
				</c:forEach>
				
				<c:if test="${attending.contains('null')}">	
			
				<form:form action="/events/join" method="POST" modelAttribute="middleTable">
					<form:hidden path="user" value="${user.id}"></form:hidden>
					<form:hidden path="event" value="${e.id}"></form:hidden>
					<button>Join Event</button>
				</form:form>
				</c:if>
				
				<c:if test="${attending == true }">
				<form action="/events/cancel" method="post">
				    <input type="hidden" name="_method" value="delete">
					<input type="hidden"  name="user" value="${user.id}">
					<input type="hidden"  name="event" value="${e.id}">
				    Joining <button>Cancel</button>
				</form>
				</c:if>
		<%-- 	</c:if> --%>
			</td>
		</tr>
	</c:forEach> 
		</tbody>
	</table>
	
	
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add An Event</h4>
      </div>
      <div class="modal-body">
			<p><form:errors path="event.*"/></p>
			<form:form action="/events" method="POST" modelAttribute="event">
				<p>
					<form:label path="name">Name: </form:label>
					<form:input type="text" path="name"/>
				</p>
				<p>
					<form:label path="date">Date: </form:label>
					<form:input type="date" path="date"/>
				</p>
				<p>
					<form:label path="description">Description: </form:label>
					<form:input type="text" path="description"/>
				</p>
				<p>
					<form:label path="city">Location: </form:label>
					<form:input type="text" path="city"/>
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
				<button>Add Event</button>
			</form:form>
  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div>
    </div>

  </div>
</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>