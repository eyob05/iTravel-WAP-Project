<div id="postsList">
    <c:forEach var = "post" items="${posts}">
    <!-- post status start -->
    <div class="card">
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
                <h6 class="author"><a href="profile?rf=${post.user.id}">${post.user.firstName} ${post.user.lastName}</a></h6>
                <span class="post-time">${post.time}</span>
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

        </div>
        <!-- post title start -->
        <div class="post-content">
            <p class="post-desc">
                ${post.details}
            </p>
            <div class="post-thumb-gallery">
                <figure class="post-thumb img-popup">
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
                            <span>41</span>
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
        <div id='comments_${post.id}' class="container mt-5">
            <div class="d-flex justify-content-center row">
                <div class="col-md-auto">
                    <div class="d-flex flex-column comment-section">
                        <div class="bg-white p-2">
                            <div class="d-flex flex-row user-info"><img class="rounded-circle" src="https://i.imgur.com/RpzrMR2.jpg" width="40">
                                <div class="d-flex flex-column justify-content-start ml-2"><span class="d-block font-weight-bold name">Marry Andrews</span><span class="date text-black-50">Shared publicly - Jan 2020</span></div>
                            </div>
                            <div class="mt-2">
                                <p class="comment-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            </div>
                        </div>
<%--                        <div class="bg-white">--%>
<%--                            --%>
<%--                        </div>--%>
                        <div class="bg-light p-2">
                            <div class="d-flex flex-row align-items-start"><img class="rounded-circle" src="https://i.imgur.com/RpzrMR2.jpg" width="40"><textarea class="form-control ml-1 shadow-none textarea"></textarea></div>
                            <div class="mt-2 text-right"><button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="button">Post Comment</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    </c:forEach>
    <!-- post status end -->


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
</div>

