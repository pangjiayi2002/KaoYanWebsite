package pojo;

import java.sql.Blob;
import java.util.Date;

public class Comment {
    private int commentId;
    private String sender;
    private int postId;
    private String receiver;
    private String content;
    private int isRead;
    private Date time;
    private Blob avatar;

    public Comment(int commentId, String sender, int postId, String receiver, String content, int isRead) {
        this.commentId = commentId;
        this.sender = sender;
        this.postId = postId;
        this.receiver = receiver;
        this.content = content;
        this.isRead = isRead;
    }

    public Comment(int commentId, String sender, int postId, String receiver, String content, int isRead, Date time, Blob avatar) {
        this.commentId = commentId;
        this.sender = sender;
        this.postId = postId;
        this.receiver = receiver;
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

    public Blob getAvater() {
        return avatar;
    }

    public void setAvater(Blob avatar) {
        this.avatar = avatar;
    }
}
