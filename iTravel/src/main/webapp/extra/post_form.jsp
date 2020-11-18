<!-- Post Modal start -->
<div class="modal fade" id="textbox" aria-labelledby="textbox">
    <div class="modal-dialog">
        <form class="share-text-box" method="post" id="addPost" action="addPost" enctype="multipart/form-data" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Share Your Mood</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      ]  <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body custom-scroll">
                    <textarea name="postDetails" id="postDetails" class="share-field-big custom-scroll" placeholder="say something..."></textarea>
                </div>
                <div class="modal-footer">
                    <input type="file"  name="image" id="image">
                    <button type="button" class="post-share-btn" data-dismiss="modal">cancel</button>
                    <button type="submit" class="post-share-btn">post</button>
                </div>
                <div id="savingPost"  style="display:none">
                    <hr>
                    Saving post..... Please wait!!
                </div>
            </div>
        </form>
    </div>
</div>
<!--Post Modal end -->