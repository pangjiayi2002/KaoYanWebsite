package pojo;

public class Post {
    private int id;
    private String title;
    private String content;
    private String username;
    private int userId;
    private int schoolId;
    private int commentAmount;
    private byte[] avatar;

    public Post(int id, String title, String content, String username,int userId,int schoolId,int commentAmount,byte[] avatar) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.username = username;
        this.userId=userId;
        this.schoolId=schoolId;
        this.commentAmount=commentAmount;
        this.avatar=avatar;
    }

    public Post() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public int getUserId(){return userId;}
    public void setUserId(int userId){this.userId=userId;}
    public int getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(int schoolId) {
        this.schoolId = schoolId;
    }

    public int getCommentAmount() {
        return commentAmount;
    }
    public void setCommentAmount(int commentAmount) {
        this.commentAmount = commentAmount;
    }
    public byte[] getAvatar(){
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }
}
