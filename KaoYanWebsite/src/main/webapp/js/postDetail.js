function showCommentDialog(){
    var comment_popup=document.getElementById("comment_popup");
    var comment_overlay=document.getElementById("comment_overlay");
    comment_popup.style.display="block";
    comment_overlay.style.display="block";
}
function closeCommentDialog(){
    var comment_popup=document.getElementById("comment_popup");
    var comment_overlay=document.getElementById("comment_overlay");
    comment_popup.style.display="none";
    comment_overlay.style.display="none";
}
// var commentBtn=document.getElementById("commentBtn")
// commentBtn.addEventListener(function () {
//     showCommentDialog();
// })
function showReplyDialog(){
    var reply_popup=document.getElementById("reply_popup");
    var reply_overlay=document.getElementById("reply_overlay");
    reply_popup.style.display="block";
    reply_overlay.style.display="block";
}
function closeReplyDialog(){
    var reply_popup=document.getElementById("reply_popup");
    var reply_overlay=document.getElementById("reply_overlay");
    reply_popup.style.display="none";
    reply_overlay.style.display="none";
}