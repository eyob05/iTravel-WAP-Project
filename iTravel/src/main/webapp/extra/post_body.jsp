<div id=""postsList">
    <c:forEach var = "post" items="${posts}">
    <!-- post status start -->
    <div class="card">
        <!-- post title start -->
        <div class="post-title d-flex align-items-center">
            <!-- profile picture end -->
            <div class="profile-thumb">
                <a href="#">
                    <figure class="profile-thumb-middle">
                        <img src="assets/images/profile/profile-small-1.jpg" alt="profile picture">
                    </figure>
                </a>
            </div>
            <!-- profile picture end -->

            <div class="posted-author">
                <h6 class="author"><a href="profile.html">${post.user.firstName} ${post.user.lastName}</a></h6>
                <span class="post-time">${post.time}</span>
            </div>
            <div class="post-settings-bar">
                <span></span>
                <span></span>
                <span></span>
                <div class="post-settings arrow-shape">
                    <ul>
                        <li><button>copy link to adda</button></li>
                        <li><button>edit post</button></li>
                        <li><button>embed adda</button></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- post title start -->
        <div class="post-content">
            <p class="post-desc">
                ${post.details}
            </p>
            <div class="post-thumb-gallery">
                <figure class="post-thumb img-popup">
                    <a href="assets/images/post/p1L.jpg">
                        <img src="assets/images/post/p1L.jpg" alt="post image">
                    </a>
                </figure>
            </div>
            <div class="post-meta">
                <button class="post-meta-like">
                    <i class="bi bi-heart-beat"></i>
                    <span>You and 201 people like this</span>
                    <strong>201</strong>
                </button>
                <ul class="comment-share-meta">
                    <li>
                        <button class="post-comment">
                            <i class="bi bi-chat-bubble"></i>
                            <span>41</span>
                        </button>
                    </li>
                    <li>
                        <button class="post-share">
                            <i class="bi bi-share"></i>
                            <span>07</span>
                        </button>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    </c:forEach>
    <!-- post status end -->
</div>