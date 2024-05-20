package pojo;

import java.sql.Blob;
import java.util.Date;

public class Comment {
    private int commentId;
    private String sender;
    private int senderId;
    private int postId;
    private String receiver;
    private int receiverId;
    private String content;
    private int isRead;
    private Date time;
    private byte[] avatar;

    public Comment(int commentId, String sender,int senderId,int postId, String receiver,int receiverId, String content, int isRead, Date time,byte[] avatar) {
        this.commentId = commentId;
        this.sender = sender;
        this.senderId=senderId;
        this.postId = postId;
        this.receiver = receiver;
        this.receiverId=receiverId;
        this.content = content;
        this.isRead = isRead;
        this.time = time;
        this.avatar=avatar;
    }
    public Comment(){}

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getIsRead() {
        return isRead;
    }

    public void setIsRead(int isRead) {
        this.isRead = isRead;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public byte[] getAvater() {
        return avatar;
    }

    public void setAvater(byte[] avatar) {
        this.avatar = avatar;
    }
    public int getSenderId(){
        return senderId;
    }
    public void setSenderId(int senderId){
        this.senderId=senderId;
    }
    public int getReceiverId() {
        return receiverId;
    }
    public void setReceiverId(int receiverId){
        this.receiverId=receiverId;
    }
}
