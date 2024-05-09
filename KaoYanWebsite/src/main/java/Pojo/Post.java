package Pojo;

public class Post {
    private int id;
    private String title;
    private String content;
    private String username;
    private int schoolId;
    private int commentAmount;

    public Post(int id, String title, String content, String username,int schoolId,int commentAmount) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.username = username;
        this.schoolId=schoolId;
        this.commentAmount=commentAmount;
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
}
