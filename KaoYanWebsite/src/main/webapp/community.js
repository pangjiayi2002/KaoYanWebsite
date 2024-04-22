function altRows(id){
    if(document.getElementsByTagName){
        var table=document.getElementById(id);
        var rows=table.getElementsByTagName("tr");

        for(i=0;i<rows.length;i++){
            if(i%2==0){
                rows[i].className="evenrowcolor"
            }else{
            rows[i].className="oddrowcolor";
            }
        }
    }
}
window.onload=function (){
    altRows('alternatecolor')
}
// const openbtn=document.getElementById('openbtn');
// const closebtn=document.getElementById('close_btn');
//const popup=document.getElementsByClassName('popup');
//const overlay=document.getElementsByClassName('overlay');
// openbtn.addEventListener('click',function (){
//     popup.style.display='block';
//     overlay.style.display='block';
// })
// /*弹出对话框*/
// function showDialog(){
//     var dialog=document.getElementById("dialog");
//     dialog.style.display="block";
// }
// /*关闭对话框*/
// function closeDialog(){
//     var dialog=document.getElementById("dialog");
//     dialog.style.display="none";
// }
function showDialog(){
    var popup=document.getElementById("popup");
    var overlay=document.getElementById("overlay")
    popup.style.display="block";
    overlay.style.display="block";
}
function closeDialog(){
    var popup=document.getElementById("popup");
    var overlay=document.getElementById("overlay")
    popup.style.display="none";
    overlay.style.display="none";
}
// const reply_popup=document.getElementsByClassName("reply_popup");
// const reply_overlay=document.getElementsByClassName("reply_overlay")
function showReplyDialog(){
    var reply_popup=document.getElementById("reply_popup");
    var reply_overlay=document.getElementById("reply_overlay")
    reply_popup.style.display="block";
    reply_overlay.style.display="block";
}
function closeReplyDialog(){
    var reply_popup=document.getElementById("reply_popup");
    var reply_overlay=document.getElementById("reply_overlay");
    reply_popup.style.display="none";
    reply_overlay.style.display="none";
}
var reply_btn=document.getElementById("reply_btn");
reply_btn.onclick=function (){
    showReplyDialog();
}