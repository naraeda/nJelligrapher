$(document).ready(function(){
	$(".like_button").click(function(){
		console.log("hello")
		var likeClass = document.getElementsByClassName("neutral")
		var likedOrNot;
		if(likeClass){
			likedOrNot = 1;
			$(".likeButton").removeClass("neutral");
			$(".likeButton").addClass("liked");
		}else{
			
			likedOrNot = -1;
		}
		console.log("hello");
		var url = "/likes/" + $(this).attr("data-photo-id");
		$.ajax({
			method: "POST",
			url: url,
			data: {
				isLiked: likedOrNot 
			}
		})
		.done(function(res){
			var likes = res;
			console.log(res)
			console.log("hello");
			$(".vote_fill").css("width", `${likes}%`);
		})
		
	})
	
	$("#signup").click(function(){
		$(".message").css("transform","translateX(100%)");
		if($(".message").hasClass("login")){
			$(".message").removeClass("login")
		}
		  $(".message").addClass("signup");
	});

	$("#login").click(function() {
	  $(".message").css("transform", "translateX(0)");
	  if ($(".message").hasClass("login")) {
	    $(".message").removeClass("signup");
	  }
	  $(".message").addClass("login");
	})
})