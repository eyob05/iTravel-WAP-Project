<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div id="postsList">
<ul class="like-page-list-wrapper">
    <c:forEach var="user" items="${sessionScope.followers}">
    <li class="unorder-list" id="${user.id}_followerlists" value="${user.id}">
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

        <div class="unorder-list-info">
            <h3 class="list-title"><a href="profile?rf=${user.id}">${user.firstName} ${user.lastName}</a></h3>
            <p class="list-subtitle"><a href="#">2 mutual</a></p>
        </div>
        <div class="profile-edit-panel">
            <button id="${user.id}_fbId" class="edit-btn">Follow Back</button>
        </div>
        <!-- <button class="like-button">
            <img class="heart" src="assets/images/icons/heart.png" alt="">
            <img class="heart-color" src="assets/images/icons/heart-color.png" alt="">
        </button> -->
    </li>
        <script>
            $("#${user.id}_fbId").click(function(){
                $.ajax( "follow", {
                    "type" : "POST",
                    "data" : {"id" : "${user.id}"}
                }).done(function(response){
                    if(response){
                        $("#${user.id}_followerlists").hide() ;
                    }

                }).fail(function (){
                    alert("Failed!");
                })
            })
        </script>
    </c:forEach>
</ul>
</div>