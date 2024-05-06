package pojo;

public class School {
    private int school_id;
    private String school_name;
    private String school_img;
    private String school_title;
    private String school_pro;

    public School() {
    }

    public School(int school_id, String school_name, String school_img, String school_title, String school_pro) {
        this.school_id = school_id;
        this.school_name = school_name;
        this.school_img = school_img;
        this.school_title = school_title;
        this.school_pro = school_pro;
    }

    public int getSchool_id() {
        return school_id;
    }

    public void setSchool_id(int school_id) {
        this.school_id = school_id;
    }

    public String getSchool_name() {
        return school_name;
    }

    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }

    public String getSchool_img() {
        return school_img;
    }

    public void setSchool_img(String school_img) {
        this.school_img = school_img;
    }

    public String getSchool_title() {
        return school_title;
    }

    public void setSchool_title(String school_title) {
        this.school_title = school_title;
    }

    public String getSchool_pro() {
        return school_pro;
    }

    public void setSchool_pro(String school_pro) {
        this.school_pro = school_pro;
    }
}
