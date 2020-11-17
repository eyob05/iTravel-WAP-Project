<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:forEach var="user" items="${sessionScope.followers}">
    <!-- post status start -->
    <div class="card" id="${user.id}_followingCard" >
        <!-- post title start -->
        <div class="post-title d-flex align-items-center">

            <!-- profile picture end -->
            <div class="profile-thumb">
                <a href="#">
                    <figure class="profile-thumb-middle">
                        <a href="profile?rf=${user.id}">
                            <img alt="assets/images/profile/male.png" src="${user.photoLink}">
                        </a>
                    </figure>
                </a>
            </div>
            <!-- profile picture end -->

            <div class="posted-author">
                <h6 class="author"><a href="profile?rf=${user.id}">${user.firstName} ${user.lastName}</a></h6>
                <span class="post-time">15 min ago</span>
            </div>
            <div class="profile-edit-panel">
                <button id="${user.id}_ufId" class="edit-btn">Unfollow</button>
            </div>
        </div>
    </div>
    <!-- post status end -->
    <script>
        $("#${user.id}_ufId").click(function(){
            console.log("click button triggered");
            $.ajax( "unfollow", {
                "type" : "POST",
                "data" : {"id" : "${user.id}"}
            }).done(function(response){
                if(response){
                    $("#${user.id}_followingCard").hide() ;
                }

            }).fail(function (){
                alert("Failed!");
            })
        })
    </script>
</c:forEach>