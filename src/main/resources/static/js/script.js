$(document).ready(function(){
	$(".like_button").click(function(){
		var id = $(this).attr("data-photo-id")
		var likeClass = document.getElementsByClassName("neutral")
		var likedOrNot;
		if($(this).hasClass("neutral")){
			likedOrNot = 1;
			$(this).removeClass();
			$(this).addClass("liked")
		}else if($(this).hasClass("liked")){
			
			likedOrNot = -1;
			$(this).removeClass("liked");
			$(this).addClass("neutral");
		}

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
			if(likes >= 100){
				$(vote).css("width", "100%");
			}else{
			$(vote).css("width", `${likes}%`);
			}
		})
		
	})
	
	$("#signup").hide();
	$("#signup").click(function(){
		$("#signup").hide();
		$("#login").show();
		$(".message").css("transform","translateX(100%)");
	});

	$("#login").click(function() {
		$("#signup").show();
		$("#login").hide();
	  $(".message").css("transform", "translateX(0)");
	})
	
	$('.like_button').click(function(){
        $(this).toggleClass('is-active');
    })
})