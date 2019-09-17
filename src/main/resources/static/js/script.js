$(document).ready(function(){
	$(".like_button").click(function(){
		console.log("hello")
		var id = $(this).attr("data-photo-id")
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
		var vote = ".vote_fill_" + id
		console.log(vote)
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
			if(likes >= 100){
				$(vote).css("width", "100%");
			}else{
				console.log("i AM IN HERE")
			$(vote).css("width", `${likes}%`);
			}
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
	
	$('.like_button').click(function(){
        $(this).toggleClass('is-active');
    })
})