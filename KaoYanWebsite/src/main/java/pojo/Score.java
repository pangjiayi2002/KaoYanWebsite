package pojo;

public class Score {
    private int school_id;
    private int score_year;
    private String Master_Type;
    private String Major_Code;
    private String Major_Name;
    private int Total_Score;
    private String Politics;
    private String English;
    private String Major_Course_One;
    private String Major_Course_Two;

    public Score() {
    }

    public Score(int school_id, int score_year, String master_Type, String major_Code, String major_Name, int total_Score, String politics, String english, String major_Course_One, String major_Course_Two) {
        this.school_id = school_id;
        this.score_year = score_year;
        Master_Type = master_Type;
        Major_Code = major_Code;
        Major_Name = major_Name;
        Total_Score = total_Score;
        Politics = politics;
        English = english;
        Major_Course_One = major_Course_One;
        Major_Course_Two = major_Course_Two;
    }

    public int getSchool_id() {
        return school_id;
    }

    public void setSchool_id(int school_id) {
        this.school_id = school_id;
    }

    public int getScore_year() {
        return score_year;
    }

    public void setScore_year(int score_year) {
        this.score_year = score_year;
    }

    public String getMaster_Type() {
        return Master_Type;
    }

    public void setMaster_Type(String master_Type) {
        Master_Type = master_Type;
    }

    public String getMajor_Code() {
        return Major_Code;
    }

    public void setMajor_Code(String major_Code) {
        Major_Code = major_Code;
    }

    public String getMajor_Name() {
        return Major_Name;
    }

    public void setMajor_Name(String major_Name) {
        Major_Name = major_Name;
    }

    public int getTotal_Score() {
        return Total_Score;
    }

    public void setTotal_Score(int total_Score) {
        Total_Score = total_Score;
    }

    public String getPolitics() {
        return Politics;
    }

    public void setPolitics(String politics) {
        Politics = politics;
    }

    public String getEnglish() {
        return English;
    }

    public void setEnglish(String english) {
        English = english;
    }

    public String getMajor_Course_One() {
        return Major_Course_One;
    }

    public void setMajor_Course_One(String major_Course_One) {
        Major_Course_One = major_Course_One;
    }

    public String getMajor_Course_Two() {
        return Major_Course_Two;
    }

    public void setMajor_Course_Two(String major_Course_Two) {
        Major_Course_Two = major_Course_Two;
    }

    @Override
    public String toString() {
        return "Score{" +
                "school_id=" + school_id +
                ", score_year=" + score_year +
                ", Master_Type='" + Master_Type + '\'' +
                ", Major_Code='" + Major_Code + '\'' +
                ", Major_Name='" + Major_Name + '\'' +
                ", Total_Score=" + Total_Score +
                ", Politics='" + Politics + '\'' +
                ", English='" + English + '\'' +
                ", Major_Course_One='" + Major_Course_One + '\'' +
                ", Major_Course_Two='" + Major_Course_Two + '\'' +
                '}';
    }
}
