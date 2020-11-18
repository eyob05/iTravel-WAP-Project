$(function(){

    (function() {
        $('#addPost').submit(function(event){
            $('#savingPost').show();
            event.preventDefault();
            var formData = new FormData(this);
            $.ajax({
               url:$(this).attr("action"),
               type:'POST',
               data: formData,
                success: addPostSuccessFunction,
                error: addPostErrorFunction,
                cache: false,
                contentType: false,
                processData: false
            });
        });

        function addPostSuccessFunction(data) {
            console.log(data);
            $("#savingPost").html('').fadeTo(900,1,function(){document.location='/home'});
            // hide loading did
             $('#savingPost').hide();

            // // empty form fields
            // $('#postDetails').val('');
            // $('#image').val('');
            //
            // // load posts
            // loadPostsFunction(data);


        }

        function addPostErrorFunction(err, status, exception) {
            console.log(err + status + exception);
        }

        // $('.postComment').click(function(event){
        //     event.preventDefault();
        //     var postId = parseInt($(this).attr("id"));
        //     var postComment = $("#" + postId + '_postCommentArea').val();
        //     $.ajax({
        //         url: 'addPostComment',
        //         type: 'POST',
        //         data: {
        //             postComment: postComment,
        //             commentPostId: postId
        //         },
        //         success: addPostCommentSuccessFunction,
        //         error: addPostCommentErrorFunction,
        //
        //     });
        // });

        function addPostCommentSuccessFunction(data) {
          console.log(JSON.stringify(data));

            //hide loading did
            $('.savingPostComment').hide();

            // empty form fields
            $('.postComment').val('');

            // load posts
            loadPostsFunction(data);


        }

        function addPostCommentErrorFunction(err, status, exception) {
            console.log(err + status + exception);
        }


    })();


    function loadPostsFunction(data) {
        console.log("ENtered loadPosts.....");
        var commentsLi = $('#postCommentsLiTemplate');
        // var postsDiv = $('#postsListDivTemplate');
        //var postsDiv = document.getElementById("postsListDivTemplate");
        var postsListDiv = $('#postsList');
        //var postsListDiv = $('#postsList');
        postsListDiv.empty();
        console.log("For each post in recieved data!");
        for (post of data) {


            postsListDiv.prepend("<p postDetails postDesc>" + post.details + "</p>");
        }

    }
    // function loadPostsFunction(data) {
    //     var commentsLi = $('#postCommentsLiTemplate');
    //     var postsDiv = $('#postsListDivTemplate');
    //     var postsListDiv = $('#postsList');
    //     postsListDiv.empty();
    //
    //     for (post of data) {
    //         let divClone = postsDiv[0].cloneNode(true);
    //         divClone.style.display = "";
    //         if (post.user != undefined) {
    //             divClone.querySelector(".postUserName").innerHTML = post.user.firstName + post.user.lastName;
    //         }
    //         divClone.querySelector(".postPublishTime").innerHTML = 'published:' + post.time;
    //         divClone.querySelector(".postImage").src = post.photo.photoLink;
    //         //divClone.querySelector(".postCommentsSize").innerHTML = post.comments.length;
    //         divClone.querySelector(".postDetails").innerHTML = post.details;
    //         divClone.querySelector(".postCommentUserImage").src = "";
    //         divClone.querySelector(".commentPostId").value = post.id;
    //         divClone.querySelector(".savingPostComment").id = post.id + '_savingPostComment';
    //         divClone.querySelector(".postCommentForm").id = post.id + '_postCommentForm';
    //         divClone.querySelector(".postComment").id = post.id + 'postComment';
    //
    //         for (comment of post.comments) {
    //             let liClone = commentsLi[0].cloneNode(true);
    //             if (comment.user != undefined) {
    //                 liClone.querySelector(".commentUserImage").src = 'uploads/' + comment.user.image;
    //                 liClone.querySelector(".commentUserName").innerHTML = comment.user.firstName + ' ' + comment.user.lastName;
    //             }
    //             liClone.querySelector(".commentTime").innerHTML = comment.time;
    //             liClone.querySelector(".commentComment").innerHTML = comment.comment;
    //             liClone.style.display = "";
    //             $(divClone).append(liClone);
    //         }
    //         postsListDiv.prepend(divClone);
    //     }
    //
    // }

    // weatherBallon(4511283);
    //
    // function drawWeather(d) {
    //     var celcius = Math.round(parseFloat(d.main.temp) - 273.15);
    //     var fahrenheit = Math.round(((parseFloat(d.main.temp) - 273.15) * 1.8) + 32);
    //     var description = d.weather[0].description;
    //
    //     document.getElementById('description').innerHTML = description;
    //     document.getElementById('temp').innerHTML = celcius + '&deg;';
    //     document.getElementById('location').innerHTML = d.name;
    //
    //     if (description.indexOf('rain') > 0) {
    //         document.body.className = 'rainy';
    //     } else if (description.indexOf('cloud') > 0) {
    //         document.body.className = 'cloudy';
    //     } else if (description.indexOf('sunny') > 0) {
    //         document.body.className = 'sunny';
    //     } else {
    //         document.body.className = 'clear';
    //     }
    // }


});