<div id="postsList">
    <c:forEach var = "post" items="${posts}">
        <!-- post status start -->
        <div id="postsListDivTemplate" class="card">
            <!-- post title start -->
            <div class="post-title d-flex align-items-center">
                <!-- profile picture end -->
                <div class="profile-thumb">
                    <a href="#">
                        <figure class="profile-thumb-middle">
                            <a href="profile?rf=${post.user.id}">
                                    <img alt="assets/images/profile/male.png" src="${post.user.photoLink}">
                            </a>
                        </figure>
                    </a>
                </div>
                <!-- profile picture end -->

                <div class="posted-author">
                    <h6 id="postUserName" class="postUserName author"><a href="profile?rf=${post.user.id}">${post.user.firstName} ${post.user.lastName}</a></h6>
                    <span class="postPublishTime post-time">${post.time}</span>
                </div>
            </div>
            <!--Delete post starts here-->
            <div id="deletePost" class="post-settings-bar">
                <span></span>
                <span></span>
                <span></span>
                <div class="post-settings arrow-shape">
                    <ul>
                        <li><button style="color: red">Delete post</button></li>
                    </ul>
                </div>
            </div>
            <!--Delete posts ends here-->

            <!-- post title start -->
            <div class="post-content">
                <p class="postDetails post-desc">
                    ${post.details}
                </p>
                <div class="postCommentUserImage post-thumb-gallery">
                    <figure class=" postCommentUserImage post-thumb img-popup">
                        <a href="${post.photo.link}">
                            <img src="${post.photo.link}" alt="">
                        </a>
                    </figure>
                </div>
                <div class="post-meta">
                    <button class="post-meta-like" id="${post.id}id" onclick="addLikes(${post.id},${post.likes})">
                        <i class="bi bi-heart-beat"></i>
                        <span id="${post.id}likespan">${post.likes} people like this</span>
                        <strong>${post.likes}</strong>
                    </button>
                    <ul class="comment-share-meta">
                        <li>
                            <button id="displayComments_${post.id}" class="post-comment">
                                <i class="bi bi-chat-bubble"></i>
                                <span>${post.comments.size()}</span>
                            </button>
                        </li>
                        <li>

                            <div class="post-settings-bar">
                                <button class="post-thumb">
                                    <i class="bi bi-location-pointer"></i>
                                </button>
                                <span></span>
                                <div class="post-settings arrow-shape">
                                    <ul>
                                        <li></li>
                                    </ul>
                                </div>

                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="comment-area">
                <div id='comments_${post.id}' class="container mt-auto">
                    <div class=" row">
                        <div class="col-md-auto">
                            <div class="comment-section">
                                <c:forEach var="comment" items="${post.comments}">
                                    <div id="postCommentsLiTemplate">
                                        <div class="bg-white pt-20" id="${post.id}${comment.id}_comment">
                                            <div class="user-info">
                                                <div class="profile-thumb">
                                                    <a href="#">
                                                        <figure class="profile-thumb-middle">
                                                            <a href="profile?rf=${comment.user.id}">
                                                                <img alt="assets/images/profile/male.png" src="${comment.user.photoLink}">
                                                            </a>
                                                        </figure>
                                                    </a>
                                                </div>
                                                <div class="d-flex flex-column justify-content-start ml-2">
                                                    <span class="d-block font-weight-bold name">${comment.user.firstName} ${comment.user.lastName}</span>
                                                    <span class="date text-black-50">Commented on - ${comment.time}</span>
                                                    <p class="comment-text">${comment.comment}</p>
                                                    <button type="submit" class="delete" style="color: red" id="${post.id}${comment.id}_button">X</button>
                                                    <hr/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </c:forEach>
            <%--                        <div class="bg-white">--%>
            <%--                            --%>
            <%--                        </div>--%>
                                <div class="bg-light p-2">
                                    <form method="POST" action="addPostComment" class="postCommentForm" id="${post.id}_postCommentForm">
                                        <div class="d-flex flex-row align-items-start">
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-middle">
                                                        <a href="profile?rf=${user.id}">
                                                            <img alt="assets/images/profile/male.png" src="${user.photoLink}">
                                                        </a>
                                                    </figure>
                                                </a>
                                            </div>
                                            <textarea id="${post.id}_postCommentArea" name="postComment" placeholder="Post your comment" class="form-control ml-1 shadow-none textarea"></textarea>
                                        </div>
                                        <input type="hidden" value="${post.id}" name="commentPostId" id="${post.id}_commentPostId" class="commentPostId">
                                        <div class="mt-2 text-right">
                                            <div style="display: none" class="savingPostComment" id="${post.id}_savingPostComment">
                                                Posting.....
                                            </div>
                                            <button id="postComment_${$post.id}" type="submit">Post Comment</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script>
                <%--$(function(){--%>
                <%--  $('#postComment_${post.id}').click(function() {--%>
                <%--      console.log(${post.id});--%>
                <%--      var postComment = $("#" + ${post.id} + '_postCommentArea').val();--%>
                <%--      $.ajax("addPostComment", {--%>
                <%--          "type": "POST",--%>
                <%--          "data": {"postComment": postComment,--%>
                <%--              "commentPostId": "${post.id}"}--%>
                <%--      }).done(function (response) {--%>


                <%--      }).fail(function () {--%>
                <%--          alert("Failed!");--%>

                <%--      });--%>
                <%--  });--%>
                <%--});--%>


            </script>
            <script>
                $(function(){
                    let hidden = true;
                    $('#comments_${post.id}').hide();

                    $('#displayComments_${post.id}').click(function(){
                        if(hidden){
                            $('#comments_${post.id}').show();
                            hidden = false;
                        }
                        else{
                            $('#comments_${post.id}').hide();
                            hidden = true;
                        }
                    });
                });
            </script>

        </div>
    </c:forEach>

        <!-- post status end -->

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
    $("#${post.id}${comment.id}_button").click(function(){
        $.ajax( "deletePostComment", {
            "type" : "POST",
            "data" : {"commentId" : "${comment.id}"}
        }).done(function(response){
            $("${post.id}${comment.id}_comment").hide();

        }).fail(function (){
            alert("Failed!");
        })

    });
</script>


<script>
    function addLikes(id,likes) {
        var num=likes;
        //  document.getElementById((id+"id")).disabled = true;
        document.getElementById((id+"likespan")).innerText="you and "+num+" people like this";
        document.getElementById((id+"id")).disabled = true;
        $.ajax({
            type: "post",
            url: "posts", //this is my servlet
            data: {likes: id},



        });
    };
</script>
